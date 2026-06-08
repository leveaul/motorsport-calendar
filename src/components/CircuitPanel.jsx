import { useState, useEffect } from "react";
import { sb, fmtRange, fmtSession, daysUntil } from '../utils';
import TrackSVG from './TrackSVG';
import Flag from './Flag';
import Spinner from './Spinner';

// Couleur par catégorie
function catColor(cat, fallback) {
  if (!cat) return fallback;
  const c = cat.toLowerCase();
  if (c.includes('hypercar') || c.includes('gtp'))    return '#0A0A40';
  if (c.includes('lmp2'))                              return '#1A6BB5';
  if (c.includes('lmgt3') || c.includes('gt3'))        return '#28A745';
  if (c.includes('pro'))                               return '#8B0000';
  if (c.includes('silver'))                            return '#888888';
  if (c.includes('gold'))                              return '#B8860B';
  if (c.includes('bronze'))                            return '#CD7F32';
  return fallback;
}

export default function CircuitPanel({ race, id, sprintRace, useUTC, onClose }) {
  const [results, setResults] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [sprintResults, setSprintResults] = useState([]);
  const [loadingR, setLoadingR] = useState(true);
  const [activeRace, setActiveRace] = useState(1);   // 1 ou 2 (Sprint Cup)
  const [activeCat, setActiveCat] = useState(null);  // null = 'Tout'
  const [info, setInfo] = useState({
    lap_length: "--", turns: "--", laps: null, lap_record: "--",
    qual_record: null, first_year: "--", prev_winner: null,
    special_stages: null, total_distance: null, surface: null
  });

  useEffect(() => {
    setResults([]); setSprintResults([]); setSessions([]);
    setLoadingR(true); setActiveRace(1); setActiveCat(null);
    const key = race.circuit_key || null;
    if (key) sb(`circuits?key=eq.${key}&limit=1`).then(d => { if (d[0]) setInfo(i => ({ ...i, ...d[0] })); }).catch(() => {});
    sb(`results?race_id=eq.${race.id}&order=race_number.asc,position.asc&limit=50`)
      .then(d => { setResults(d); setLoadingR(false); }).catch(() => setLoadingR(false));
    if (sprintRace?.id) sb(`results?race_id=eq.${sprintRace.id}&order=position.asc&limit=25`).then(setSprintResults).catch(() => {});
    sb(`sessions?race_id=eq.${race.id}&order=datetime_utc.asc`).then(setSessions).catch(() => {});
  }, [race.id, sprintRace?.id, race.circuit_key]);

  // Grouper résultats par race_number puis par catégorie
  const raceNumbers = [...new Set(results.map(r => r.race_number || 1))].sort();
  const hasMultiRace = raceNumbers.length > 1;
  const currentRaceResults = results.filter(r => (r.race_number || 1) === activeRace);
  const categories = [...new Set(currentRaceResults.map(r => r.category).filter(Boolean))];
  const hasCategories = categories.length > 0;

  // Résultats affichés selon catégorie active
  const displayedResults = hasCategories && activeCat
    ? currentRaceResults.filter(r => r.category === activeCat)
    : currentRaceResults;

  const stats = (() => {
    const base = [["📅", "Date", fmtRange(race.date_start, race.date_end)], ["🗓️", "Au calendrier", info.first_year]];
    const winner = info.prev_winner ? [["🏆", "Vainqueur préc.", info.prev_winner]] : [];
    if (race.series_id === "WRC") return [
      ...(info.special_stages ? [["🔢", "Spéciales", `${info.special_stages} ES`]] : []),
      ...(info.total_distance ? [["📏", "Distance", info.total_distance]] : []),
      ...(info.surface ? [["🛣️", "Surface", info.surface]] : []),
      ...base, ...winner,
    ];
    return [
      ["📏", "Longueur", info.lap_length],
      ["↩️", "Virages", info.turns !== "--" ? `${info.turns}` : "--"],
      ...(info.laps ? [["🔄", "Tours", `${info.laps} tours`]] : []),
      ["🏁", "Record course", info.lap_record],
      ...(info.qual_record ? [["⚡", race.series_id === "F1" ? "Record qualif" : "Record all-time", info.qual_record]] : []),
      ...base, ...winner,
    ];
  })();

  return (
    <div style={{ background: "#F7F7F7", borderRadius: 18, overflow: "hidden" }}>
      {/* Header */}
      <div style={{ background: `linear-gradient(135deg,${id.color},${id.color}CC)`, padding: "14px 16px 12px", display: "flex", alignItems: "flex-start", justifyContent: "space-between" }}>
        <div>
          <div style={{ fontSize: 22, fontWeight: 900, color: "#fff", fontFamily: "'Barlow Condensed',sans-serif" }}>{race.name}</div>
          <div style={{ fontSize: 12, color: "rgba(255,255,255,.7)", marginTop: 2 }}>{race.circuit}</div>
        </div>
        <button onClick={onClose} style={{ background: "rgba(255,255,255,.2)", border: "none", color: "#fff", width: 32, height: 32, borderRadius: 8, cursor: "pointer", fontSize: 16, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>✕</button>
      </div>

      {/* Grille tracé + infos */}
      <div className="circuit-panel-inner" style={{ padding: "20px 28px", display: "grid", gridTemplateColumns: "2fr 1fr", gap: 20 }}>
        <div style={{ background: "#fff", borderRadius: 12, border: `1px solid ${id.color}15`, padding: 12, display: "flex", flexDirection: "column", alignItems: "center", overflow: "hidden" }}>
          <div style={{ fontSize: 11, color: "#BBB", letterSpacing: 1.5, marginBottom: 6, fontWeight: 700 }}>TRACE</div>
          <div className="track-img-wrap" style={{ width: "100%", height: 440, display: "flex", alignItems: "center", justifyContent: "center", overflow: "hidden" }}>
            <TrackSVG circuit={race.circuit} color={id.color} size={160} seriesId={race.series_id} circuitKey={race.circuit_key} />
          </div>
        </div>
        <div style={{ display: "flex", flexDirection: "column", gap: 8, overflowY: "auto", maxHeight: 500 }}>
          {stats.map(([emoji, label, val]) => (
            <div key={label} style={{ background: "#fff", borderRadius: 10, border: "1px solid #F0F0F0", padding: "9px 13px", display: "flex", alignItems: "flex-start", gap: 9, flexShrink: 0 }}>
              <span style={{ fontSize: 16, flexShrink: 0, marginTop: 1 }}>{emoji}</span>
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ fontSize: 9, color: "#BBB", letterSpacing: 1.5, fontWeight: 700, marginBottom: 2 }}>{label.toUpperCase()}</div>
                <div style={{ fontSize: 13, fontWeight: 700, color: "#222", fontFamily: "'Barlow Condensed',sans-serif", lineHeight: 1.3 }}>{val}</div>
              </div>
            </div>
          ))}
          {!(race.status === "done" || race.date_start < new Date().toISOString().slice(0, 10)) && (
            <div style={{ background: id.bg, borderRadius: 12, padding: "14px 18px", border: `1px dashed ${id.color}40`, display: "flex", alignItems: "center", justifyContent: "center", gap: 12, flexShrink: 0 }}>
              <Flag country={race.country} size={20} />
              <div style={{ fontSize: 16, color: id.text, fontWeight: 700 }}>
                {daysUntil(race.date_start) === 0 ? "C'est aujourd'hui !" : `Dans ${daysUntil(race.date_start)} jours`}
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Programme */}
      {sessions.length > 0 && (
        <div style={{ padding: "0 16px 14px", borderTop: `1px solid ${id.color}15` }}>
          <div style={{ fontSize: 11, fontWeight: 700, color: "#BBB", letterSpacing: 1.5, padding: "14px 0 10px" }}>PROGRAMME</div>
          <div className="programme-grid" style={{ display: "grid", gridTemplateColumns: `repeat(${Math.min(sessions.length, 6)}, 1fr)`, gap: 10 }}>
            {sessions.map((s, i) => {
              const t = s.type.toLowerCase();
              const isPast = new Date(s.datetime_utc) < new Date();
              const sessionColor =
                t.includes('course') || t.includes('race')       ? id.color :
                t.includes('sprint qualif') || t.includes('shootout') ? '#FF8C00' :
                t.includes('sprint')                              ? '#FF6B00' :
                t.includes('qualif') || t.includes('hyperpole')  ? '#0077CC' :
                '#888888';
              return (
                <div key={i} style={{ background: isPast ? '#F8F8F8' : `${sessionColor}12`, borderRadius: 10, padding: "10px 12px", border: `1.5px solid ${isPast ? '#E8E8E8' : sessionColor + '50'}`, opacity: isPast ? 0.55 : 1 }}>
                  <div style={{ fontSize: 10, fontWeight: 800, color: sessionColor, letterSpacing: 0.5, marginBottom: 4 }}>{s.type.toUpperCase()}</div>
                  <div style={{ fontSize: 13, fontWeight: 700, color: isPast ? '#AAA' : '#333', fontFamily: "'Barlow Condensed',sans-serif" }}>
                    {fmtSession(s.datetime_utc, useUTC)}
                  </div>
                  {useUTC && <div style={{ fontSize: 10, color: "#BBB" }}>UTC</div>}
                  {s.duration_min && <div style={{ fontSize: 10, color: "#AAA", marginTop: 2 }}>{s.duration_min} min</div>}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Résultats */}
      {(results.length > 0 || loadingR) && (
        <div style={{ padding: "0 16px 16px", borderTop: `1px solid ${id.color}15` }}>
          {/* Onglets Race 1 / Race 2 */}
          {hasMultiRace && (
            <div style={{ display: "flex", gap: 8, padding: "12px 0 8px" }}>
              {raceNumbers.map(n => (
                <button key={n} onClick={() => { setActiveRace(n); setActiveCat(null); }}
                  style={{ padding: "6px 16px", borderRadius: 20, border: `1.5px solid ${activeRace===n ? id.color : '#DDD'}`, background: activeRace===n ? id.color : '#fff', color: activeRace===n ? '#fff' : '#888', fontSize: 13, fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
                  Race {n}
                </button>
              ))}
            </div>
          )}

          {/* Onglets catégories */}
          {hasCategories && !hasMultiRace && (
            <div style={{ display: "flex", gap: 6, padding: "12px 0 8px", flexWrap: "wrap" }}>
              {/* Onglet "Tout" */}
              <button onClick={() => setActiveCat(null)}
                style={{ padding: "5px 14px", borderRadius: 20, border: `1.5px solid ${!activeCat ? '#333' : '#DDD'}`, background: !activeCat ? '#333' : '#fff', color: !activeCat ? '#fff' : '#AAA', fontSize: 12, fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
                Tout
              </button>
              {/* Onglet par catégorie */}
              {categories.map(cat => {
                const cc = catColor(cat, id.color);
                const isActive = activeCat === cat;
                return (
                  <button key={cat} onClick={() => setActiveCat(cat)}
                    style={{ padding: "5px 14px", borderRadius: 20, border: `1.5px solid ${isActive ? cc : '#DDD'}`, background: isActive ? cc : '#fff', color: isActive ? '#fff' : '#888', fontSize: 12, fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
                    {cat}
                  </button>
                );
              })}
            </div>
          )}

          {!hasMultiRace && !hasCategories && <div style={{ fontSize: 11, fontWeight: 700, color: "#BBB", letterSpacing: 1.5, padding: "14px 0 10px" }}>RÉSULTATS</div>}

          {loadingR && <Spinner color={id.color} />}
          {!loadingR && (
            <div style={{ display: "grid", gridTemplateColumns: sprintResults.length > 0 ? "1fr 1fr" : "1fr", gap: 12 }}>
              <ResultsList results={displayedResults} id={id} seriesId={race.series_id} label={null} />
              {sprintResults.length > 0 && <ResultsList results={sprintResults} id={{ color: "#FF6B00", bg: "#FFF5EE", text: "#CC4400" }} seriesId={race.series_id} label="SPRINT" sprint />}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

function ResultsList({ results, id, seriesId, label, sprint }) {
  // Grouper par catégorie si plusieurs catégories présentes
  const cats = [...new Set(results.map(r => r.category).filter(Boolean))];
  const showCatHeaders = cats.length > 1;

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: 6 }}>
      {label && <div style={{ fontSize: 10, fontWeight: 700, color: id.color, letterSpacing: 1 }}>{label}</div>}
      {results.map((r, i) => {
        const cc = catColor(r.category, id.color);
        // Afficher un header de catégorie si changement de cat
        const showCatHeader = showCatHeaders && (i === 0 || results[i-1].category !== r.category);
        // Position dans sa catégorie (pour les médailles)
        const catPos = showCatHeaders ? results.filter((x, j) => j < i && x.category === r.category).length : i;
        return (<>
          {showCatHeader && (
            <div key={`cat-${r.category}`} style={{ display: "flex", alignItems: "center", gap: 8, marginTop: i > 0 ? 6 : 0 }}>
              <div style={{ height: 2, flex: 1, background: `${cc}40`, borderRadius: 1 }} />
              <div style={{ fontSize: 10, fontWeight: 800, color: cc, letterSpacing: 1, padding: "2px 10px", background: `${cc}15`, borderRadius: 20 }}>{r.category}</div>
              <div style={{ height: 2, flex: 1, background: `${cc}40`, borderRadius: 1 }} />
            </div>
          )}
        <div key={i} style={{ display: "flex", alignItems: "center", gap: 8, padding: "7px 10px", background: catPos === 0 ? (showCatHeaders ? `${cc}10` : id.bg) : "#fff", border: `1px solid ${catPos === 0 ? (showCatHeaders ? cc + "40" : id.color + "30") : "#F0F0F0"}`, borderRadius: 9, flexShrink: 0 }}>
          <div style={{ width: 26, height: 26, borderRadius: 7, background: catPos === 0 ? (showCatHeaders ? cc : id.color) : catPos === 1 ? "#C0C0C0" : catPos === 2 ? "#CD7F32" : "#F5F5F5", display: "flex", alignItems: "center", justifyContent: "center", fontSize: i < 3 ? 11 : 10, fontWeight: 800, color: i < 3 ? "#fff" : "#AAA", flexShrink: 0 }}>
            {catPos < 3 ? ["🥇", "🥈", "🥉"][catPos] : r.position}
          </div>
          <div style={{ flex: 1, minWidth: 0 }}>
            <div className="result-driver" style={{ fontSize: 14, fontWeight: 700, color: catPos === 0 ? (showCatHeaders ? cc : id.text) : "#222", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis", fontFamily: "'Barlow Condensed',sans-serif" }}>{r.driver}</div>
            {r.team && <div style={{ fontSize: 10, color: "#BBB" }}>{r.team}</div>}
          </div>
          <div style={{ textAlign: "right", flexShrink: 0 }}>
            {seriesId !== "WRC" && r.points > 0 && <div style={{ fontSize: 13, fontWeight: 800, color: id.color, fontFamily: "'Barlow Condensed',sans-serif" }}>{r.points} pts</div>}
            {r.gap && <div style={{ fontSize: seriesId === "WRC" ? 12 : 10, color: seriesId === "WRC" ? "#555" : "#CCC", fontFamily: "'Barlow Condensed',sans-serif" }}>{r.gap}</div>}
          </div>
        </div>
        </>) })}
    </div>
  );
}
