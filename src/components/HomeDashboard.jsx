import { useState, useEffect } from "react";
import { sb, fmtRange, daysUntil, getImgUrl } from '../utils';
import { getNextSession } from '../hooks';
import { SERIES_ID, SERIES_LOGOS } from '../config';
import Flag from './Flag';
import Countdown from './Countdown';

export default function HomeDashboard({ series, onSelect }) {
  const today = new Date().toISOString().slice(0, 10);
  const [data, setData] = useState({});

  useEffect(() => {
    series.forEach(s => {
      Promise.all([
        sb(`races?series_id=eq.${s.id}&date_start=gte.${today}&type=neq.sprint&order=date_start.asc&limit=1`),
        sb(`standings?series_id=eq.${s.id}&type=eq.driver&season=eq.2026&order=position.asc&limit=3`)
      ]).then(([races, standing]) => {
        const nextRace = races[0] || null;
        if (nextRace) {
          sb(`sessions?race_id=eq.${nextRace.id}&order=datetime_utc.asc`)
            .then(sessions => setData(prev => ({ ...prev, [s.id]: { next: nextRace, top3: standing, nextSession: getNextSession(sessions) } })))
            .catch(() => setData(prev => ({ ...prev, [s.id]: { next: nextRace, top3: standing, nextSession: null } })));
        } else {
          setData(prev => ({ ...prev, [s.id]: { next: null, top3: standing, nextSession: null } }));
        }
      }).catch(() => {});
    });
  }, [series]);

  return (
    <div style={{ animation: "slideUp .3s ease" }}>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill,minmax(320px,1fr))", gap: 20 }}>
        {[...series].sort((a, b) => {
          const da = data[a.id]?.next?.date_start || '9999';
          const db = data[b.id]?.next?.date_start || '9999';
          return da.localeCompare(db);
        }).map(s => {
          const sid = SERIES_ID[s.id] || {};
          const d = data[s.id];
          const next = d?.next;
          const top3 = d?.top3 || [];
          const nextSession = d?.nextSession || null;
          const imgUrl = next ? getImgUrl(next) : null;
          const days = next ? daysUntil(next.date_start) : null;

          return (
            <div key={s.id} onClick={() => onSelect(s.id)}
              style={{ background: "#fff", border: "0.5px solid #E8E8E8", borderRadius: 20, overflow: "hidden", cursor: "pointer", transition: "border-color .15s", borderTop: `3px solid ${sid.color}` }}
              onMouseEnter={e => e.currentTarget.style.borderColor = sid.color}
              onMouseLeave={e => e.currentTarget.style.borderColor = '#E8E8E8'}>
              {/* Header */}
              <div style={{ padding: "18px 20px 12px", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
                  {SERIES_LOGOS[s.id]
                    ? <img src={SERIES_LOGOS[s.id]} alt={s.id} style={{ height: 28, maxWidth: 80, objectFit: "contain" }} />
                    : <span style={{ fontSize: 25 }}>{sid.icon}</span>
                  }
                  <div>
                    <div style={{ fontSize: 30, fontWeight: 900, color: "#111" }}>{sid.label}</div>
                    <div style={{ fontSize: 12, fontWeight: 700, letterSpacing: 1, color: "#BBB" }}>2026</div>
                  </div>
                </div>
                {days !== null && (
                  <div style={{ textAlign: "right" }}>
                    {nextSession
                      ? <>
                          <Countdown targetIso={nextSession.datetime_utc} color={sid.color} size={0.85} />
                          <div style={{ fontSize: 9, color: "#CCC", letterSpacing: 1, fontWeight: 600, marginTop: 2 }}>{nextSession.type.toUpperCase()}</div>
                        </>
                      : <>
                          <div style={{ fontSize: 48, fontWeight: 900, color: sid.color, lineHeight: 1 }}>{days}</div>
                          <div style={{ fontSize: 10, color: "#CCC", letterSpacing: 1.5, fontWeight: 600 }}>JOURS</div>
                        </>
                    }
                  </div>
                )}
              </div>
              {/* Tracé */}
              <div style={{ height: 188, background: "#FAFAFA", display: "flex", alignItems: "center", justifyContent: "center", borderTop: "0.5px solid #F0F0F0", borderBottom: "0.5px solid #F0F0F0", overflow: "hidden" }}>
                {imgUrl
                  ? <img src={imgUrl} alt={next?.circuit} style={{ width: "100%", height: "100%", objectFit: "contain" }} onError={e => e.target.style.display = 'none'} />
                  : <div style={{ fontSize: 40, opacity: .1 }}>🏁</div>}
              </div>
              {/* Prochain event */}
              <div style={{ padding: "12px 20px 15px", borderBottom: "0.5px solid #F5F5F5" }}>
                {next ? (
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                    <div style={{ minWidth: 0 }}>
                      <div style={{ fontSize: 25, fontWeight: 800, color: "#111", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{next.name}</div>
                      <div style={{ fontSize: 12, color: "#BBB", marginTop: 1, display: "flex", alignItems: "center", gap: 6 }}>
                        <Flag country={next.country} size={12} />
                        {fmtRange(next.date_start, next.date_end)}
                      </div>
                    </div>
                    {days === 0 && <span style={{ fontSize: 12, fontWeight: 700, color: "#fff", background: sid.color, padding: "4px 10px", borderRadius: 25 }}>AUJ.</span>}
                  </div>
                ) : (
                  <div style={{ fontSize: 15, color: "#DDD", textAlign: "center" }}>Saison terminée</div>
                )}
              </div>
              {/* Top 3 */}
              <div style={{ padding: "12px 20px 18px" }}>
                <div style={{ fontSize: 10, fontWeight: 700, letterSpacing: 1.5, color: "#CCC", marginBottom: 8 }}>CLASSEMENT</div>
                {top3.length === 0 && <div style={{ fontSize: 14, color: "#DDD", textAlign: "center" }}>—</div>}
                {top3.map((r, i) => (
                  <div key={i} style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: i < 2 ? 6 : 0 }}>
                    <div style={{ width: 25, height: 25, borderRadius: 8, background: i === 0 ? sid.color : i === 1 ? "#C0C0C0" : "#CD7F32", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 12, fontWeight: 800, color: "#fff", flexShrink: 0 }}>{i + 1}</div>
                    <div style={{ flex: 1, fontSize: 20, fontWeight: 700, color: "#222", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{r.name}</div>
                    <div style={{ fontSize: 22, fontWeight: 900, color: sid.color, flexShrink: 0 }}>{r.points}</div>
                  </div>
                ))}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
