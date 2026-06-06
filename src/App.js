import { useState, useEffect } from "react";
import { sb, fmtRange, daysUntil, getImgUrl } from './utils';
import { SERIES_ID, SERIES_LOGOS, MONTHS_FR } from './config';
import { getNextSession } from './hooks';
import Flag from './components/Flag';
import Spinner from './components/Spinner';
import Countdown from './components/Countdown';
import CircuitPanel from './components/CircuitPanel';
import StandingsPanel from './components/StandingsPanel';
import HomeDashboard from './components/HomeDashboard';
import NextSessionBanner from './components/NextSessionBanner';

const GLOBAL_CSS = `
  @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&display=swap');
  @keyframes spin{to{transform:rotate(360deg)}}
  @keyframes pulse{0%,100%{opacity:1}50%{opacity:.5}}
  @keyframes slideUp{from{opacity:0;transform:translateY(12px)}to{opacity:1;transform:none}}
  @keyframes fadeIn{from{opacity:0}to{opacity:1}}
  *{box-sizing:border-box}
  button{font-family:inherit}
  html,body{max-width:100vw;overflow-x:hidden}
  body{background:#F2F2F0}
  .inner{width:100%;max-width:1750px;margin:0 auto;padding:0 30px}
  .tiles{display:grid;grid-template-columns:repeat(2,1fr);gap:15px}
  @media(min-width:875px){.tiles{grid-template-columns:repeat(3,1fr)}}
  @media(min-width:1250px){.tiles{grid-template-columns:repeat(4,1fr)}}
  @media(min-width:1625px){.tiles{grid-template-columns:repeat(5,1fr)}}
  .tile{background:#fff;border:0.6px solid #E8E8E8;border-radius:18px;overflow:hidden;cursor:pointer;transition:border-color .15s}
  .tile:hover{border-color:var(--sc,#E8002D)60}
  .tile.done{opacity:.7}
  .tile.next-race{border:2px solid var(--sc,#E8002D)}
  .tile-top{padding:15px 18px 10px;display:flex;justify-content:space-between;align-items:flex-start}
  .tile-date{background:#F5F5F5;border-radius:10px;padding:6px 12px;text-align:center;min-width:55px}
  .tile-day{font-size:40px;font-weight:900;line-height:1;color:var(--sc,#E8002D)}
  .tile-day.past{color:#CCC}
  .tile-month{font-size:14px;font-weight:700;letter-spacing:1px;color:#BBB;text-transform:uppercase}
  .tile-track{height:200px;background:#FAFAFA;display:flex;align-items:center;justify-content:center;overflow:hidden;border-top:0.6px solid #F0F0F0;border-bottom:0.6px solid #F0F0F0}
  .tile-track img{width:100%;height:100%;object-fit:contain}
  .tile-foot{padding:12px 18px 16px}
  .tile-name{font-size:24px;font-weight:800;color:#111;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  .tile-name.past{color:#AAA}
  .tile-circuit{font-size:16px;color:#BBB;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-top:1px}
  .tile-badges{display:flex;gap:5px;margin-top:10px;flex-wrap:wrap;align-items:center}
  .badge{font-size:15px;font-weight:700;padding:4px 10px;border-radius:25px}
  .b-res{background:#FEF0F2;color:#B0001F}
  .b-sprint{background:#FFF0E0;color:#CC4400}
  .b-days{background:#F0F0F0;color:#888}
  .b-next{color:#fff}
  .stab{padding:15px 28px;border:none;border-bottom:4px solid transparent;background:transparent;font-family:inherit;font-size:21px;font-weight:600;color:#BBB;cursor:pointer;white-space:nowrap;transition:all .15s;display:flex;align-items:center;gap:6px}
  .stab.active{font-weight:800;border-bottom-color:var(--sc)}
  .stab:hover:not(.active){color:#555}
  .fbtn{padding:11px 25px;border-radius:25px;border:0.6px solid #DDD;background:#fff;font-family:inherit;font-size:18px;font-weight:600;cursor:pointer;color:#888;transition:all .15s}
  .fbtn.active{color:#fff;border-color:var(--sc)}
  .circuit-panel-inner{padding:20px 28px}
  @media(min-width:1125px){
    .inner{padding:0 50px}
    .tile-track{height:175px}
    .tile-name{font-size:20px}
    .tile-day{font-size:32px}
    .stab{font-size:19px;padding:15px 28px}
    .next-name{font-size:40px !important}
    .next-days{font-size:75px !important}
  }
  @media(max-width:899px){
    .header-logo{display:none !important}
    .stab{padding:9px 12px !important;font-size:14px !important}
    .stab-label{display:none !important}
    .stab-home-label{display:none !important}
    .app-inner{padding:0 10px !important}
    .tiles{grid-template-columns:1fr !important}
    .tile-track{height:130px !important}
    .tile-name{font-size:18px !important}
    .tile-day{font-size:28px !important}
    .circuit-panel-inner{grid-template-columns:1fr !important;padding:12px !important}
    .track-img-wrap{height:200px !important}
    .next-name{font-size:28px !important}
  }
`;

export default function App() {
  const [series, setSeries] = useState([]);
  const [active, setActive] = useState("F1");
  const [view, setView] = useState("home");
  const [races, setRaces] = useState([]);
  const [loading, setLoading] = useState(false);
  const [filter, setFilter] = useState("upcoming");
  const [selected, setSelected] = useState(null);
  const [useUTC, setUseUTC] = useState(false);

  const today = new Date().toISOString().slice(0, 10);
  const id = SERIES_ID[active] || {};

  // Charger les séries
  useEffect(() => {
    sb("series?order=id.asc").then(setSeries).catch(() => {});
  }, []);

  // Charger les courses quand la série active change
  useEffect(() => {
    if (view !== "series") return;
    setLoading(true); setSelected(null);
    sb(`races?series_id=eq.${active}&order=date_start.asc,type.asc`).then(async r => {
      // Marquer les courses avec résultats
      const withResults = await Promise.all(r.map(async race => {
        if (race.status !== "done") return race;
        try {
          const res = await sb(`results?race_id=eq.${race.id}&limit=1&select=id`);
          return { ...race, _hasResults: res.length > 0 };
        } catch { return race; }
      }));
      setRaces(withResults); setLoading(false);
    }).catch(() => setLoading(false));
  }, [active, view]);

  // Changer le titre de l'onglet
  useEffect(() => {
    document.title = view === "series" ? `${id.label} — Motorsport 2026` : "Motorsport 2026";
  }, [view, active]);

  const mainRaces = races.filter(r => r.type !== "sprint" && !r.name?.toLowerCase().startsWith("sprint"));
  const sprintRaces = races.filter(r => r.type === "sprint" || r.name?.toLowerCase().startsWith("sprint"));
  const sprintRounds = new Set(sprintRaces.map(r => r.round).filter(Boolean));

  const getSprintForRace = race => {
    if (race.round != null) {
      const s = sprintRaces.find(s => s.round === race.round);
      if (s) return s;
    }
    return sprintRaces.find(s =>
      s.date_start === race.date_start ||
      s.date_start === new Date(new Date(race.date_start + "T12:00:00").getTime() - 86400000).toISOString().slice(0, 10)
    ) || null;
  };

  const next = races.find(r => r.date_start >= today && r.status !== "done" && r.type !== "sprint");
  const dNext = next ? daysUntil(next.date_start) : null;
  const doneCount = races.filter(r => r.status === "done" && r.type !== "sprint").length;
  const totalCount = races.filter(r => r.type !== "sprint").length;

  const displayed = filter === "upcoming"
    ? mainRaces.filter(r => r.date_end >= today)
    : filter === "results"
    ? mainRaces.filter(r => r.status === "done").reverse()
    : mainRaces;

  return (
    <div style={{ minHeight: "100vh", background: "#F2F2F0", fontFamily: "'Barlow Condensed','Arial Narrow',sans-serif", overflowX: "hidden", width: "100%" }}>
      <style>{GLOBAL_CSS}</style>

      {/* Header */}
      <div style={{ background: "#fff", borderBottom: "0.5px solid #EBEBEB", position: "sticky", top: 0, zIndex: 100 }}>
        <div className="inner">
          <div style={{ display: "flex", alignItems: "stretch", overflowX: "auto", gap: 0 }}>
            {/* Logo */}
            <div className="header-logo" style={{ display: "flex", alignItems: "center", paddingRight: 20, flexShrink: 0, borderRight: "0.5px solid #F0F0F0", marginRight: 8 }}>
              <div>
                <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: 3, color: "#BBB" }}>CALENDRIER</div>
                <div style={{ fontSize: 32, fontWeight: 900, color: "#111" }}>MOTORSPORT <span style={{ color: "#E8002D" }}>2026</span></div>
              </div>
            </div>
            {/* Accueil */}
            <button className="stab" style={{ "--sc": "#666", color: view === "home" ? "#444" : "#BBB", borderBottomColor: view === "home" ? "#444" : "transparent", fontWeight: view === "home" ? 800 : 600, flexShrink: 0 }} onClick={() => setView("home")}>
              🏠<span className="stab-home-label"> Accueil</span>
            </button>
            {/* Onglets séries */}
            {series.map(s => {
              const sid = SERIES_ID[s.id] || {};
              const isA = active === s.id && view === "series";
              return (
                <button key={s.id} className={`stab${isA ? " active" : ""}`}
                  style={{ "--sc": sid.color, color: isA ? sid.color : "#BBB", flexShrink: 0 }}
                  onClick={() => { setActive(s.id); setView("series"); }}>
                  {SERIES_LOGOS[s.id]
                    ? <img src={SERIES_LOGOS[s.id]} alt={s.id} style={{ height: 18, maxWidth: 60, objectFit: "contain", filter: isA ? "none" : "grayscale(1) opacity(0.5)" }} />
                    : sid.icon
                  }
                  <span className="stab-label"> {s.id}</span>
                </button>
              );
            })}
            {/* Switch UTC/Local */}
            <div style={{ display: "flex", alignItems: "center", gap: 6, marginLeft: "auto", marginRight: 12, flexShrink: 0 }}>
              <span style={{ fontSize: 10, fontWeight: 700, color: !useUTC ? "#333" : "#BBB", letterSpacing: 0.5 }}>LOCAL</span>
              <div onClick={() => setUseUTC(u => !u)} style={{ width: 36, height: 20, borderRadius: 10, background: useUTC ? "#E8002D" : "#DDD", cursor: "pointer", position: "relative", transition: "background .2s", flexShrink: 0 }}>
                <div style={{ position: "absolute", top: 3, left: useUTC ? 19 : 3, width: 14, height: 14, borderRadius: "50%", background: "#fff", transition: "left .2s", boxShadow: "0 1px 3px rgba(0,0,0,.3)" }} />
              </div>
              <span style={{ fontSize: 10, fontWeight: 700, color: useUTC ? "#E8002D" : "#BBB", letterSpacing: 0.5 }}>UTC</span>
            </div>
          </div>
        </div>
      </div>

      {/* Contenu */}
      <div className="inner app-inner" style={{ paddingTop: 24, paddingBottom: 60 }}>

        {/* HOME */}
        {view === "home" && (
          <HomeDashboard series={series} onSelect={sid => { setActive(sid); setView("series"); }} />
        )}

        {/* SÉRIE */}
        {view === "series" && loading && <Spinner color={id.color} />}
        {view === "series" && !loading && <>

          {/* Banner prochaine course */}
          {next && (
            <div style={{ background: `linear-gradient(135deg,${id.color},${id.color}CC)`, borderRadius: 18, padding: "22px 35px", display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 20, animation: "slideUp .3s ease" }}>
              <div>
                <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: 3, color: "rgba(255,255,255,.55)", marginBottom: 3 }}>PROCHAINE COURSE</div>
                <div className="next-name" style={{ fontSize: 40, fontWeight: 900, color: "#fff" }}>{next.name}</div>
                <div style={{ fontSize: 15, color: "rgba(255,255,255,.65)", marginTop: 3, display: "flex", alignItems: "center", gap: 8 }}>
                  <Flag country={next.country} size={14} />
                  {fmtRange(next.date_start, next.date_end)}{next.circuit ? ` — ${next.circuit}` : ""}
                </div>
              </div>
              <div style={{ textAlign: "right" }}>
                {dNext === 0
                  ? <div style={{ fontSize: 22, fontWeight: 900, color: "#fff" }}>AUJOURD'HUI !</div>
                  : <NextSessionBanner raceId={next.id} color="#fff" />
                }
              </div>
            </div>
          )}

          {/* Barre progression */}
          {totalCount > 0 && (
            <div style={{ marginBottom: 16 }}>
              <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 4 }}>
                <span style={{ fontSize: 14, color: "#BBB", fontWeight: 600 }}>SAISON 2026 — {doneCount}/{totalCount} GP</span>
                <span style={{ fontSize: 14, color: id.color, fontWeight: 700 }}>{Math.round((doneCount / totalCount) * 100)}%</span>
              </div>
              <div style={{ height: 3, background: "#E8E8E8", borderRadius: 2, overflow: "hidden" }}>
                <div style={{ height: "100%", width: `${Math.round((doneCount / totalCount) * 100)}%`, background: id.color, borderRadius: 2, transition: "width .5s" }} />
              </div>
            </div>
          )}

          {/* Filtres */}
          <div style={{ display: "flex", gap: 8, marginBottom: 20 }}>
            {[["upcoming", "À venir"], ["all", "Calendrier"], ["results", "Résultats"], ["standings", "Classement"]].map(([v, l]) => (
              <button key={v} className={`fbtn${filter === v ? " active" : ""}`}
                style={{ "--sc": id.color, background: filter === v ? id.color : "#fff" }}
                onClick={() => setFilter(v)}>{l}</button>
            ))}
          </div>

          {/* Classement */}
          {filter === "standings" && (
            <div style={{ animation: "slideUp .25s ease" }}>
              <StandingsPanel seriesId={active} id={id} />
            </div>
          )}

          {/* Tuiles */}
          {filter !== "standings" && (
            <div className="tiles" style={{ animation: "slideUp .25s ease" }}>
              {displayed.length === 0 && (
                <div style={{ gridColumn: "1/-1", textAlign: "center", color: "#CCC", padding: 60, fontSize: 20 }}>Aucune course</div>
              )}
              {displayed.map(race => {
                const done = race.status === "done";
                const isNext = next?.id === race.id;
                const days = daysUntil(race.date_start);
                const imgUrl = getImgUrl(race);
                return (
                  <div key={race.id}>
                    <div className={`tile${done ? " done" : ""}${isNext ? " next-race" : ""}`}
                      style={{ "--sc": id.color }}
                      onClick={() => setSelected(selected?.id === race.id ? null : race)}>
                      <div className="tile-top">
                        <div className="tile-date">
                          <div className={`tile-day${done ? " past" : ""}`}>{new Date(race.date_start + "T12:00:00").getDate()}</div>
                          <div className="tile-month">{MONTHS_FR[new Date(race.date_start + "T12:00:00").getMonth()]}</div>
                        </div>
                        <Flag country={race.country} size={20} />
                      </div>
                      <div className="tile-track">
                        {imgUrl
                          ? <img src={imgUrl} alt={race.circuit} onError={e => e.target.style.display = "none"} />
                          : <div style={{ fontSize: 45, opacity: .1 }}>🏁</div>}
                      </div>
                      <div className="tile-foot">
                        <div className={`tile-name${done ? " past" : ""}`}>{race.name}</div>
                        <div className="tile-circuit">{race.circuit}</div>
                        <div className="tile-badges">
                          {isNext && <span className="badge b-next" style={{ background: id.color }}>Prochain</span>}
                          {done && race._hasResults && <span className="badge b-res">Résultats</span>}
                          {sprintRounds.has(race.round) && <span className="badge b-sprint">Sprint</span>}
                          {!done && !isNext && days !== null && days >= 0 && <span className="badge b-days">{days}j</span>}
                        </div>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          {/* Footer */}
          <div style={{ marginTop: 24, padding: "15px 25px", background: "#fff", borderRadius: 12, border: "0.5px solid #EFEFEF", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
            <span style={{ fontSize: 15, color: "#CCC", fontWeight: 600, letterSpacing: 1 }}>{races.length} COURSES · SUPABASE · 2026</span>
            <span style={{ fontSize: 15, fontWeight: 800, color: "#BBB" }}>MOTORSPORT 2026</span>
          </div>
        </>}
      </div>

      {/* Modal */}
      {selected && (
        <div onClick={e => { if (e.target === e.currentTarget) setSelected(null); }}
          style={{ position: "fixed", inset: 0, zIndex: 1000, background: "rgba(0,0,0,.6)", backdropFilter: "blur(4px)", display: "flex", alignItems: "center", justifyContent: "center", padding: 16, animation: "fadeIn .2s ease" }}>
          <div style={{ width: "100%", maxWidth: "min(1400px, calc(100vw - 32px))", maxHeight: "92vh", overflowY: "auto", borderRadius: 18, boxShadow: "0 24px 80px rgba(0,0,0,.4)", animation: "slideUp .25s cubic-bezier(.4,0,.2,1)" }}>
            <CircuitPanel race={selected} id={id} sprintRace={getSprintForRace(selected)} useUTC={useUTC} onClose={() => setSelected(null)} />
          </div>
        </div>
      )}
    </div>
  );
}
