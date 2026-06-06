import { useState, useEffect } from "react";

export function getNextSession(sessions) {
  const now = new Date();
  return sessions
    .filter(s => new Date(s.datetime_utc) > now)
    .sort((a, b) => new Date(a.datetime_utc) - new Date(b.datetime_utc))[0] || null;
}

export function useCountdown(targetIso) {
  const [diff, setDiff] = useState(null);
  useEffect(() => {
    if (!targetIso) { setDiff(null); return; }
    const tick = () => {
      const ms = new Date(targetIso) - new Date();
      if (ms <= 0) { setDiff(null); return; }
      const d = Math.floor(ms / 86400000);
      const h = Math.floor((ms % 86400000) / 3600000);
      const m = Math.floor((ms % 3600000) / 60000);
      const s = Math.floor((ms % 60000) / 1000);
      setDiff({ d, h, m, s, ms });
    };
    tick();
    const id = setInterval(tick, 1000);
    return () => clearInterval(id);
  }, [targetIso]);
  return diff;
}
