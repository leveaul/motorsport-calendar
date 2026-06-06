import { useState, useEffect } from "react";
import { sb } from '../utils';
import { getNextSession } from '../hooks';
import Countdown from './Countdown';

export default function NextSessionBanner({ raceId, color }) {
  const [nextSession, setNextSession] = useState(null);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    if (!raceId) return;
    sb(`sessions?race_id=eq.${raceId}&order=datetime_utc.asc`)
      .then(sessions => { setNextSession(getNextSession(sessions)); setLoaded(true); })
      .catch(() => setLoaded(true));
  }, [raceId]);

  if (!loaded) return <div style={{ fontSize: 40, fontWeight: 900, color, lineHeight: 1 }}>…</div>;
  if (!nextSession) return null;

  return (
    <div style={{ textAlign: "right" }}>
      <Countdown targetIso={nextSession.datetime_utc} color={color} size={1.1} />
      <div style={{ fontSize: 10, color, opacity: .55, letterSpacing: 1.5, marginTop: 4 }}>
        {nextSession.type.toUpperCase()}
      </div>
    </div>
  );
}
