import { useState, useEffect } from "react";

const SUPABASE_URL = "https://qgdcutklhgnlcrxuvgkn.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnZGN1dGtsaGdubGNyeHV2Z2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4NzQ0NjAsImV4cCI6MjA5NTQ1MDQ2MH0.ltV5jlQfoF4OS6078lwwRAV-q-IDN7biLzHzM1tkUI8";
const H = { "apikey": SUPABASE_KEY, "Authorization": `Bearer ${SUPABASE_KEY}` };

async function sb(path) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, { headers: H });
  if (!r.ok) throw new Error(await r.text());
  return r.json();
}

const SERIES_IDENTITY = {
  F1:    { label:"Formula 1",      color:"#E8002D", bg:"#FFF0F2", textColor:"#B0001F", icon:"🏎️" },
  MotoGP:{ label:"MotoGP",         color:"#D50032", bg:"#FFF0F1", textColor:"#A50027", icon:"🏍️" },
  WEC:   { label:"FIA WEC",        color:"#0066CC", bg:"#EFF6FF", textColor:"#004A9E", icon:"⏱️" },
  ELMS:  { label:"ELMS",           color:"#00833E", bg:"#EDFAF3", textColor:"#006030", icon:"🏁" },
  IMSA:  { label:"IMSA",           color:"#0033A0", bg:"#EEF2FF", textColor:"#002280", icon:"🇺🇸" },
  GTWCE: { label:"GT WC Europe",   color:"#FF6600", bg:"#FFF4EE", textColor:"#CC4400", icon:"🏆" },
};

const MONTHS_FR = ["Jan","Fév","Mar","Avr","Mai","Jun","Jul","Aoû","Sep","Oct","Nov","Déc"];

function fmtDate(d) {
  if (!d) return "";
  const x = new Date(d + "T12:00:00");
  return `${x.getDate()} ${MONTHS_FR[x.getMonth()]}`;
}
function fmtRange(s, e) {
  if (!s) return "";
  if (!e || s === e) return fmtDate(s);
  const a = new Date(s+"T12:00:00"), b = new Date(e+"T12:00:00");
  if (a.getMonth() === b.getMonth()) return `${a.getDate()}–${b.getDate()} ${MONTHS_FR[a.getMonth()]}`;
  return `${fmtDate(s)} → ${fmtDate(e)}`;
}
function daysUntil(d) {
  if (!d) return null;
  const t = new Date(); t.setHours(0,0,0,0);
  const x = new Date(d+"T00:00:00"); x.setHours(0,0,0,0);
  return Math.ceil((x - t) / 86400000);
}

function Spinner({ color }) {
  return (
    <div style={{ display:"flex", justifyContent:"center", padding:"40px 0" }}>
      <div style={{
        width:28, height:28, borderRadius:"50%",
        border:`3px solid ${color}30`, borderTop:`3px solid ${color}`,
        animation:"spin .7s linear infinite",
      }}/>
    </div>
  );
}

function RaceCard({ race, id, active, onClick }) {
  const today = new Date().toISOString().slice(0,10);
  const done = race.status === "done";
  const live = race.status === "live";
  const days = daysUntil(race.date_start);
  return (
    <div onClick={() => onClick(race)} style={{
      display:"flex", alignItems:"center",
      background: active ? `${id.color}08` : "#FFFFFF",
      border:`1.5px solid ${active ? id.color : live ? id.color : "#E8E8E8"}`,
      borderLeft:`4px solid ${live ? id.color : done ? "#D0D0D0" : id.color}`,
      borderRadius:10, cursor:"pointer", transition:"all .15s",
      overflow:"hidden", opacity: done && !race._hasResults ? 0.5 : 1,
    }}>
      <div style={{
        minWidth:56, padding:"12px 0",
        background: live ? id.color : done ? "#F5F5F5" : id.bg,
        display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", flexShrink:0,
      }}>
        <div style={{ fontSize:20, fontWeight:900, lineHeight:1, color: live ? "#fff" : done ? "#AAAAAA" : id.color, fontFamily:"'Barlow Condensed', sans-serif" }}>
          {new Date(race.date_start+"T12:00:00").getDate()}
        </div>
        <div style={{ fontSize:10, fontWeight:600, letterSpacing:1, textTransform:"uppercase", color: live ? "#ffffff99" : done ? "#BBBBBB" : id.textColor }}>
          {MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}
        </div>
      </div>
      <div style={{ flex:1, padding:"10px 12px", minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:2 }}>
          {live && <span style={{ fontSize:9, fontWeight:700, letterSpacing:1.5, color:"#fff", background:id.color, padding:"2px 7px", borderRadius:4 }}>LIVE</span>}
          {done && race._hasResults && <span style={{ fontSize:9, fontWeight:600, color:id.textColor, background:id.bg, padding:"2px 6px", borderRadius:4 }}>RÉSULTATS ↓</span>}
          {race.type === 'sprint' && (
            <span style={{ fontSize:9, fontWeight:700, color:'#FF6B00', background:'#FFF0E0', padding:'2px 6px', borderRadius:4, letterSpacing:.5 }}>SPRINT</span>
          )}
          {race.type === 'sprint_weekend' && race.series_id === 'MotoGP' && (
            <span style={{ fontSize:9, fontWeight:600, color:'#888', background:'#F2F2F2', padding:'2px 6px', borderRadius:4, letterSpacing:.5 }}>+ SPRINT SAM.</span>
          )}
          {race.type === 'sprint_weekend' && race.series_id === 'F1' && (
            <span style={{ fontSize:9, fontWeight:700, color:'#E8002D', background:'#FFF0F2', padding:'2px 6px', borderRadius:4, letterSpacing:.5 }}>SPRINT WE</span>
          )}
          {(race.type !== 'sprint' && race.type !== 'sprint_weekend') && race.round && (
            <span style={{ fontSize:10, color:'#AAAAAA', fontWeight:600 }}>R{race.round}</span>
          )}
        </div>
        <div style={{ fontSize:14, fontWeight:700, color: done ? "#999" : "#111", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed', sans-serif" }}>
          {race.name}
        </div>
        <div style={{ fontSize:11, color:"#AAAAAA", marginTop:1, whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis" }}>
          {race.circuit}{race.country ? ` · ${race.country}` : ""}
        </div>
      </div>
      {!done && days !== null && (
        <div style={{ padding:"0 14px", textAlign:"center", flexShrink:0 }}>
          {days === 0 ? <div style={{ fontSize:11, fontWeight:800, color:id.color }}>AUJ.</div>
            : days > 0 ? <><div style={{ fontSize:days<=99?22:16, fontWeight:900, color:days<=7?id.color:"#CCCCCC", lineHeight:1, fontFamily:"'Barlow Condensed', sans-serif" }}>{days}</div><div style={{ fontSize:9, color:"#CCCCCC", letterSpacing:1, fontWeight:600 }}>J</div></> : null}
        </div>
      )}
    </div>
  );
}

function ResultsPanel({ race, id, onClose }) {
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    sb(`results?race_id=eq.${race.id}&order=position.asc`).then(r => { setResults(r); setLoading(false); }).catch(() => setLoading(false));
  }, [race.id]);
  const MEDALS = ["🥇","🥈","🥉"];
  return (
    <div style={{ background:"#FAFAFA", border:`1.5px solid ${id.color}40`, borderTop:"none", borderRadius:"0 0 10px 10px", overflow:"hidden" }}>
      <div style={{ display:"flex", justifyContent:"space-between", alignItems:"center", padding:"10px 14px", background:id.bg, borderBottom:`1px solid ${id.color}20` }}>
        <div style={{ fontSize:11, fontWeight:700, color:id.textColor, letterSpacing:1 }}>RÉSULTATS — {race.name.toUpperCase()}</div>
        <button onClick={onClose} style={{ background:"transparent", border:"none", color:"#AAAAAA", fontSize:16, cursor:"pointer" }}>✕</button>
      </div>
      {loading && <Spinner color={id.color}/>}
      {!loading && results.length === 0 && <div style={{ textAlign:"center", color:"#CCCCCC", fontSize:13, padding:"20px 0" }}>Pas encore de résultats</div>}
      {!loading && results.length > 0 && (
        <div style={{ padding:"8px 10px", display:"flex", flexDirection:"column", gap:4 }}>
          {results.map((r, i) => (
            <div key={i} style={{ display:"flex", alignItems:"center", gap:10, padding:"8px 10px", background:i===0?id.bg:i<3?"#FAFAFA":"#FFFFFF", border:`1px solid ${i===0?id.color+"40":"#F0F0F0"}`, borderRadius:8 }}>
              <div style={{ width:28, height:28, borderRadius:6, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?14:11, fontWeight:800, color:i<3?"#fff":"#AAAAAA", flexShrink:0 }}>
                {i<3 ? MEDALS[i] : r.position}
              </div>
              <div style={{ flex:1, minWidth:0 }}>
                <div style={{ fontSize:13, fontWeight:700, color:i===0?id.textColor:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed', sans-serif" }}>{r.driver}</div>
                {r.team && <div style={{ fontSize:10, color:"#BBBBBB" }}>{r.team}</div>}
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                {r.points > 0 && <div style={{ fontSize:13, fontWeight:800, color:id.color, fontFamily:"'Barlow Condensed', sans-serif" }}>{r.points} pts</div>}
                {r.gap && <div style={{ fontSize:10, color:"#CCCCCC" }}>{r.gap}</div>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function StandingsPanel({ seriesId, id }) {
  const [tab, setTab] = useState("driver");
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    setLoading(true);
    sb(`standings?series_id=eq.${seriesId}&type=eq.${tab}&season=eq.2026&order=position.asc`).then(r => { setData(r); setLoading(false); }).catch(() => setLoading(false));
  }, [seriesId, tab]);
  const maxPts = data[0]?.points || 1;
  return (
    <div>
      <div style={{ display:"flex", gap:6, marginBottom:14 }}>
        {[["driver","Pilotes"],["team","Équipes"]].map(([v,l]) => (
          <button key={v} onClick={() => setTab(v)} style={{ padding:"6px 16px", borderRadius:20, border:`1.5px solid ${tab===v?id.color:"#E8E8E8"}`, background:tab===v?id.color:"#fff", color:tab===v?"#fff":"#888", fontSize:12, fontWeight:700, cursor:"pointer", fontFamily:"'Barlow Condensed', sans-serif" }}>{l}</button>
        ))}
      </div>
      {loading && <Spinner color={id.color}/>}
      {!loading && data.length === 0 && <div style={{ textAlign:"center", color:"#DDD", fontSize:13, padding:"30px 0" }}>Classement pas encore disponible</div>}
      {!loading && data.length > 0 && (
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {data.map((s, i) => (
            <div key={i} style={{ background:"#fff", border:`1.5px solid ${i===0?id.color+"60":"#EFEFEF"}`, borderLeft:`4px solid ${i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E8E8E8"}`, borderRadius:10, padding:"10px 14px", display:"flex", alignItems:"center", gap:12 }}>
              <div style={{ fontSize:18, fontWeight:900, color:i===0?id.color:i<3?"#888":"#DDDDDD", minWidth:28, textAlign:"center", fontFamily:"'Barlow Condensed', sans-serif" }}>{s.position}</div>
              <div style={{ flex:1, minWidth:0 }}>
                <div style={{ fontSize:14, fontWeight:700, color:i===0?"#111":"#333", fontFamily:"'Barlow Condensed', sans-serif" }}>{s.name}</div>
                {s.nationality && <div style={{ fontSize:10, color:"#AAAAAA" }}>{s.nationality}</div>}
                <div style={{ marginTop:5, height:3, background:"#F0F0F0", borderRadius:2, overflow:"hidden" }}>
                  <div style={{ height:"100%", width:`${Math.round((s.points/maxPts)*100)}%`, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E0E0E0", borderRadius:2 }}/>
                </div>
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                <div style={{ fontSize:22, fontWeight:900, lineHeight:1, color:i===0?id.color:"#CCCCCC", fontFamily:"'Barlow Condensed', sans-serif" }}>{s.points}</div>
                <div style={{ fontSize:9, color:"#CCCCCC", letterSpacing:1, fontWeight:600 }}>PTS</div>
                {s.wins > 0 && <div style={{ fontSize:10, color:id.color, fontWeight:700, marginTop:2 }}>{s.wins} V</div>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default function App() {
  const [series, setSeries] = useState([]);
  const [active, setActive] = useState("F1");
  const [races, setRaces] = useState([]);
  const [filter, setFilter] = useState("upcoming");
  const [loading, setLoading] = useState(true);
  const [selectedRace, setSelectedRace] = useState(null);

  const today = new Date().toISOString().slice(0,10);
  const id = SERIES_IDENTITY[active] || SERIES_IDENTITY.F1;

  useEffect(() => { sb("series?order=id.asc").then(setSeries).catch(console.error); }, []);

  useEffect(() => {
    setLoading(true); setSelectedRace(null);
    sb(`races?series_id=eq.${active}&order=date_start.asc`).then(async r => {
      const doneIds = r.filter(x => x.status==="done").map(x => x.id);
      if (doneIds.length > 0) {
        const res = await sb(`results?race_id=in.(${doneIds.join(",")})&select=race_id`).catch(() => []);
        const withRes = new Set(res.map(x => x.race_id));
        r = r.map(x => ({ ...x, _hasResults: withRes.has(x.id) }));
      }
      setRaces(r); setLoading(false);
    }).catch(() => setLoading(false));
  }, [active]);

  const displayed = filter==="upcoming" ? races.filter(r => r.date_end>=today)
    : filter==="results" ? races.filter(r => r.status==="done").reverse() : races;
  const next = races.find(r => r.date_start>=today && r.status!=="done");
  const dNext = next ? daysUntil(next.date_start) : null;
  const doneCount = races.filter(r => r.status==="done").length;

  return (
    <div style={{ minHeight:"100vh", background:"#F7F7F7", color:"#111", fontFamily:"'Barlow Condensed','Arial Narrow',sans-serif", paddingBottom:60 }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;500;600;700;800;900&display=swap');
        @keyframes spin { to { transform:rotate(360deg) } }
        @keyframes pulse { 0%,100%{opacity:1} 50%{opacity:.5} }
        @keyframes slideUp { from{opacity:0;transform:translateY(8px)} to{opacity:1;transform:none} }
        * { box-sizing:border-box; } button { font-family:inherit; }
      `}</style>

      <div style={{ position:"sticky", top:0, zIndex:20, background:"#fff", borderBottom:"1.5px solid #EFEFEF", padding:"0 16px" }}>
        <div style={{ maxWidth:600, margin:"0 auto" }}>
          <div style={{ height:4, background:id.color, margin:"0 -16px" }}/>
          <div style={{ padding:"12px 0 0" }}>
            <div style={{ fontSize:11, fontWeight:700, letterSpacing:3, color:"#AAAAAA", textTransform:"uppercase" }}>Calendrier</div>
            <div style={{ fontSize:24, fontWeight:900, lineHeight:1, color:"#111" }}>
              MOTORSPORT <span style={{ color:id.color }}>2026</span>
            </div>
          </div>
          <div style={{ display:"flex", gap:0, marginTop:12, overflowX:"auto", scrollbarWidth:"none", borderBottom:"1.5px solid #F0F0F0" }}>
            {series.map(s => {
              const sid = SERIES_IDENTITY[s.id] || {};
              const isActive = active === s.id;
              return (
                <button key={s.id} onClick={() => setActive(s.id)} style={{ padding:"8px 16px", border:"none", borderBottom:`3px solid ${isActive?sid.color:"transparent"}`, background:"transparent", color:isActive?sid.color:"#AAAAAA", fontSize:12, fontWeight:isActive?800:600, letterSpacing:.5, cursor:"pointer", whiteSpace:"nowrap", transition:"all .15s" }}>
                  {sid.icon} {s.id}
                </button>
              );
            })}
          </div>
        </div>
      </div>

      <div style={{ maxWidth:600, margin:"0 auto", padding:"0 14px" }}>
        {next && !loading && (
          <div style={{ margin:"16px 0 14px", background:`linear-gradient(135deg,${id.color},${id.color}DD)`, borderRadius:14, padding:"16px 18px", display:"flex", justifyContent:"space-between", alignItems:"center", boxShadow:`0 4px 20px ${id.color}30`, animation:"slideUp .3s ease" }}>
            <div>
              <div style={{ fontSize:9, fontWeight:700, letterSpacing:2.5, color:"rgba(255,255,255,0.65)", marginBottom:4, textTransform:"uppercase" }}>Prochaine course</div>
              <div style={{ fontSize:18, fontWeight:900, color:"#fff", lineHeight:1.1, fontFamily:"'Barlow Condensed',sans-serif" }}>{next.name}</div>
              <div style={{ fontSize:11, color:"rgba(255,255,255,0.65)", marginTop:4 }}>{fmtRange(next.date_start,next.date_end)}{next.circuit?` · ${next.circuit}`:""}</div>
            </div>
            <div style={{ textAlign:"right" }}>
              {dNext===0 ? <div style={{ fontSize:14, fontWeight:900, color:"#fff" }}>AUJOURD'HUI</div>
                : <><div style={{ fontSize:44, fontWeight:900, color:"#fff", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{dNext}</div><div style={{ fontSize:10, color:"rgba(255,255,255,0.6)", letterSpacing:2, fontWeight:600 }}>JOURS</div></>}
            </div>
          </div>
        )}

        {!loading && races.length > 0 && (
          <div style={{ marginBottom:14 }}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:5 }}>
              <span style={{ fontSize:11, color:"#AAAAAA", fontWeight:600 }}>SAISON 2026 — {doneCount}/{races.length} COURSES</span>
              <span style={{ fontSize:11, color:id.color, fontWeight:700 }}>{Math.round((doneCount/races.length)*100)}%</span>
            </div>
            <div style={{ height:4, background:"#EFEFEF", borderRadius:2, overflow:"hidden" }}>
              <div style={{ height:"100%", width:`${Math.round((doneCount/races.length)*100)}%`, background:`linear-gradient(90deg,${id.color},${id.color}CC)`, borderRadius:2, transition:"width .5s ease" }}/>
            </div>
          </div>
        )}

        <div style={{ display:"flex", gap:6, marginBottom:14, padding:"6px", background:"#EFEFEF", borderRadius:10 }}>
          {[["upcoming","À venir"],["all","Calendrier"],["results","Résultats"],["standings","Classement"]].map(([v,l]) => (
            <button key={v} onClick={() => setFilter(v)} style={{ flex:1, padding:"7px 0", borderRadius:7, border:"none", background:filter===v?"#fff":"transparent", color:filter===v?id.color:"#AAAAAA", fontSize:11, fontWeight:filter===v?800:600, cursor:"pointer", boxShadow:filter===v?"0 1px 4px rgba(0,0,0,0.08)":"none", transition:"all .15s" }}>{l}</button>
          ))}
        </div>

        {loading && <Spinner color={id.color}/>}

        {!loading && filter==="standings" && <div style={{ animation:"slideUp .25s ease" }}><StandingsPanel seriesId={active} id={id}/></div>}

        {!loading && filter!=="standings" && (
          <div style={{ display:"flex", flexDirection:"column", gap:6, animation:"slideUp .25s ease" }}>
            {displayed.length===0 && <div style={{ textAlign:"center", color:"#CCCCCC", fontSize:13, padding:40 }}>Aucune course</div>}
            {displayed.map(race => (
              <div key={race.id}>
                <RaceCard race={race} id={id} active={selectedRace?.id===race.id} onClick={r => setSelectedRace(selectedRace?.id===r.id?null:r)}/>
                {selectedRace?.id===race.id && race.status==="done" && <ResultsPanel race={race} id={id} onClose={() => setSelectedRace(null)}/>}
              </div>
            ))}
          </div>
        )}

        {!loading && (
          <div style={{ marginTop:24, padding:"12px 16px", background:"#fff", borderRadius:10, border:"1.5px solid #EFEFEF", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
            <span style={{ fontSize:10, color:"#CCCCCC", fontWeight:600, letterSpacing:1 }}>{races.length} COURSES · SUPABASE</span>
            <span style={{ fontSize:10, fontWeight:800, color:id.color }}>{id.label.toUpperCase()} 2026</span>
          </div>
        )}
      </div>
    </div>
  );
}
