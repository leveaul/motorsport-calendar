import { useState, useEffect } from "react";
import { sb } from '../utils';
import Spinner from './Spinner';

export default function StandingsPanel({ seriesId, id }) {
  const [tab, setTab] = useState("driver");
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    sb(`standings?series_id=eq.${seriesId}&type=eq.${tab}&season=eq.2026&order=position.asc`)
      .then(r => { setData(r); setLoading(false); })
      .catch(() => setLoading(false));
  }, [seriesId, tab]);

  const maxPts = data[0]?.points || 1;

  return (
    <div>
      <div style={{ display: "flex", gap: 8, marginBottom: 12 }}>
        {[["driver", "Pilotes"], ["team", "Equipes"]].map(([v, l]) => (
          <button key={v} onClick={() => setTab(v)}
            style={{ padding: "8px 20px", borderRadius: 25, border: `1.5px solid ${tab === v ? id.color : "#E8E8E8"}`, background: tab === v ? id.color : "#fff", color: tab === v ? "#fff" : "#888", fontSize: 15, fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
            {l}
          </button>
        ))}
      </div>
      {loading && <Spinner color={id.color} />}
      {!loading && data.length === 0 && <div style={{ textAlign: "center", color: "#DDD", fontSize: 16, padding: "30px 0" }}>Classement pas encore disponible</div>}
      {!loading && data.length > 0 && (
        <div style={{ display: "flex", flexDirection: "column", gap: 6 }}>
          {data.map((s, i) => (
            <div key={i} style={{ background: "#fff", border: `1.5px solid ${i === 0 ? id.color + "60" : "#EFEFEF"}`, borderLeft: `4px solid ${i === 0 ? id.color : i === 1 ? "#C0C0C0" : i === 2 ? "#CD7F32" : "#E8E8E8"}`, borderRadius: 12, padding: "11px 15px", display: "flex", alignItems: "center", gap: 12 }}>
              <div style={{ fontSize: 21, fontWeight: 900, color: i === 0 ? id.color : i < 3 ? "#888" : "#DDD", minWidth: 32, textAlign: "center", fontFamily: "'Barlow Condensed',sans-serif" }}>{s.position}</div>
              <div style={{ flex: 1, minWidth: 0 }}>
                <div className="standings-name" style={{ fontSize: 16, fontWeight: 700, color: i === 0 ? "#111" : "#333", fontFamily: "'Barlow Condensed',sans-serif" }}>{s.name}</div>
                {s.nationality && <div style={{ fontSize: 12, color: "#AAA" }}>{s.nationality}</div>}
                <div style={{ marginTop: 4, height: 3, background: "#F0F0F0", borderRadius: 2, overflow: "hidden" }}>
                  <div style={{ height: "100%", width: `${Math.round((s.points / maxPts) * 100)}%`, background: i === 0 ? id.color : i === 1 ? "#C0C0C0" : i === 2 ? "#CD7F32" : "#E0E0E0", borderRadius: 2 }} />
                </div>
              </div>
              <div style={{ textAlign: "right", flexShrink: 0 }}>
                <div className="standings-pts" style={{ fontSize: 25, fontWeight: 900, lineHeight: 1, color: i === 0 ? id.color : "#CCC", fontFamily: "'Barlow Condensed',sans-serif" }}>{s.points}</div>
                <div style={{ fontSize: 10, color: "#CCC", letterSpacing: 1, fontWeight: 600 }}>PTS</div>
                {s.wins > 0 && <div style={{ fontSize: 12, color: id.color, fontWeight: 700 }}>{s.wins}V</div>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
