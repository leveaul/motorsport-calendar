import { useState, useEffect } from "react";

const SUPABASE_URL = "https://qgdcutklhgnlcrxuvgkn.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnZGN1dGtsaGdubGNyeHV2Z2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4NzQ0NjAsImV4cCI6MjA5NTQ1MDQ2MH0.ltV5jlQfoF4OS6078lwwRAV-q-IDN7biLzHzM1tkUI8";
const H = { "apikey": SUPABASE_KEY, "Authorization": `Bearer ${SUPABASE_KEY}` };
async function sb(path) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, { headers: H });
  if (!r.ok) throw new Error(await r.text());
  return r.json();
}

// ── Series identity ───────────────────────────────────────────────────────
const SERIES_ID = {
  F1:    { label:"Formula 1",    color:"#E8002D", bg:"#FFF0F2", text:"#B0001F", icon:"🏎️", heroEmoji:"🏎️" },
  MotoGP:{ label:"MotoGP",       color:"#D50032", bg:"#FFF0F1", text:"#A50027", icon:"🏍️", heroEmoji:"🏍️" },
  WEC:   { label:"FIA WEC",      color:"#0066CC", bg:"#EFF6FF", text:"#004A9E", icon:"⏱️", heroEmoji:"⏱️" },
  ELMS:  { label:"ELMS",         color:"#00833E", bg:"#EDFAF3", text:"#006030", icon:"🏁", heroEmoji:"🏁" },
  IMSA:  { label:"IMSA",         color:"#0033A0", bg:"#EEF2FF", text:"#002280", icon:"🏆", heroEmoji:"🏆" },
  GTWCE: { label:"GT WC Europe", color:"#FF6600", bg:"#FFF4EE", text:"#CC4400", icon:"🏆", heroEmoji:"🏆" },
};

// ── Country → flag image (flagcdn.com) ───────────────────────────────────
const COUNTRY_CODES = {
  "Australie":"au","Chine":"cn","Japon":"jp","États-Unis":"us","Canada":"ca",
  "Monaco":"mc","Espagne":"es","Autriche":"at","Angleterre":"gb","Grande-Bretagne":"gb",
  "Belgique":"be","Hongrie":"hu","Pays-Bas":"nl","Italie":"it","Azerbaïdjan":"az",
  "Singapour":"sg","Mexique":"mx","Brésil":"br","Qatar":"qa","Abu Dhabi":"ae",
  "Bahreïn":"bh","Thaïlande":"th","Indonésie":"id","Malaisie":"my","France":"fr",
  "Portugal":"pt","Allemagne":"de","Rép. Tchèque":"cz","Argentine":"ar",
};

function Flag({ country, size=20 }) {
  const code = COUNTRY_CODES[country];
  if (!code) return <span style={{ fontSize: size*0.7, lineHeight:1 }}>🏁</span>;
  return (
    <img
      src={`https://flagcdn.com/w${size*2}/${code}.png`}
      alt={country}
      style={{ width: size*1.4, height: size, objectFit:"cover", borderRadius:2, display:"block" }}
      onError={e => { e.target.style.display="none"; }}
    />
  );
}

// ── Circuit track SVGs (paths dessinés à la main pour chaque circuit) ────
const TRACK_SVGS = {
  // Monaco — tracé caractéristique en épingle
  monaco: `<path d="M35 115 L35 95 Q35 80 42 72 L55 60 Q65 52 78 50 L100 48 Q115 48 128 55 L148 68 Q160 78 160 92 L158 108 Q154 120 142 126 L118 132 Q100 135 82 130 L60 122 Q42 118 35 115Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Silverstone — forme caractéristique papillon
  silverstone: `<path d="M25 95 L28 72 Q32 58 48 50 L72 42 Q88 38 105 40 L128 46 Q148 54 158 68 L164 85 Q165 100 158 114 L142 126 Q122 134 100 134 L75 132 Q52 126 38 114 L27 102 Q24 98 25 95Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Monza — ovale avec chicanes
  monza: `<path d="M30 88 L30 52 Q30 36 46 32 L154 32 Q170 36 170 52 L170 88 Q170 108 154 112 L132 115 L132 90 L68 90 L68 115 L46 112 Q30 108 30 88Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Spa — forme longue avec Eau Rouge
  spa: `<path d="M22 118 L22 82 Q24 62 42 52 L68 38 Q88 30 110 36 L145 48 Q168 60 170 80 L168 104 Q162 124 142 130 L105 136 L98 108 L75 108 L68 136 L48 130 Q28 122 22 118Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Suzuka — figure en 8 caractéristique
  suzuka: `<path d="M28 105 L28 68 Q30 50 48 42 L82 34 Q98 32 112 40 L130 54 Q144 68 138 84 L122 94 Q106 102 90 94 L76 82 Q68 70 74 58 L90 48" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
           <path d="M138 84 L152 100 Q160 115 152 128 L130 136 Q106 142 84 136 L58 126 Q36 116 28 105" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round"/>`,

  // Le Mans Sarthe — long circuit avec Mulsanne
  lemans: `<path d="M18 128 L18 88 Q20 65 38 55 L68 44 Q90 38 115 40 L152 50 Q172 62 174 80 L170 100 L140 100 L140 80 L115 80 L115 100 L85 100 L85 80 L60 80 L60 128 Q40 132 18 128Z" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Catalunya
  catalunya: `<path d="M30 108 L30 78 Q32 60 50 52 L88 42 Q110 38 132 46 L158 60 Q172 74 170 94 L164 116 Q156 132 136 137 L94 140 Q62 138 46 126 L32 114 Q28 112 30 108Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Jerez
  jerez: `<path d="M35 112 L35 80 Q37 62 55 55 L92 44 Q115 40 138 50 L160 65 Q172 80 168 100 L160 122 Q148 138 125 141 L82 142 Q55 140 42 126 L35 112Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Mugello
  mugello: `<path d="M28 112 L28 75 Q30 55 52 46 L88 36 Q112 30 138 40 L162 58 Q175 75 172 98 L164 120 Q152 138 128 142 L84 144 Q52 142 38 126 L28 112Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Buriram Thailand
  buriram: `<path d="M30 105 L30 70 Q32 52 52 45 L95 38 Q120 36 140 46 L162 62 Q172 78 168 98 L158 120 Q146 135 122 138 L80 140 Q52 138 38 124 L30 105Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Albert Park
  albertpark: `<path d="M32 100 L32 72 Q34 55 52 48 L90 42 Q112 40 130 50 L158 66 Q172 80 168 98 L160 120 Q148 135 124 138 L82 140 Q54 138 40 124 L32 100Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Red Bull Ring
  redbullring: `<path d="M60 130 L30 105 Q22 88 28 68 L45 48 Q62 35 85 35 L130 38 Q155 44 168 65 L172 88 Q170 108 155 120 L130 130 L60 130Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Yas Marina
  yasmarina: `<path d="M25 100 L28 72 Q32 54 50 45 L88 36 Q115 32 140 42 L164 58 Q176 76 172 98 L160 122 Q144 138 118 142 L78 144 Q48 140 34 122 L25 100Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Imola
  imola: `<path d="M32 108 L32 78 Q34 60 54 52 L92 42 Q116 38 140 48 L162 64 Q174 80 170 100 L162 122 Q150 138 128 142 L86 144 Q56 140 42 126 L32 108Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Circuit Paul Ricard
  paulricard: `<path d="M25 108 L25 75 Q27 55 48 46 L88 36 Q115 32 142 42 L166 60 Q178 78 174 100 L166 124 Q152 140 128 144 L82 146 Q50 142 36 126 L25 108Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,

  // Tracé générique
  default: `<path d="M30 108 Q28 80 48 64 L88 50 Q118 42 148 58 L170 80 Q178 102 165 122 L138 136 Q106 144 76 136 L48 122 Q28 114 30 108Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
};

// Associer un circuit à son tracé SVG
function getTrackKey(circuit) {
  if (!circuit) return "default";
  const c = circuit.toLowerCase();
  if (c.includes("monaco")) return "monaco";
  if (c.includes("silverstone")) return "silverstone";
  if (c.includes("monza")) return "monza";
  if (c.includes("spa")) return "spa";
  if (c.includes("suzuka")) return "suzuka";
  if (c.includes("sarthe") || (c.includes("mans") && c.includes("24"))) return "lemans";
  if (c.includes("bugatti") || (c.includes("mans") && c.includes("bugatti"))) return "paulricard";
  if (c.includes("paul ricard") || c.includes("castellet")) return "paulricard";
  if (c.includes("catalunya") || c.includes("barcelona")) return "catalunya";
  if (c.includes("jerez")) return "jerez";
  if (c.includes("mugello")) return "mugello";
  if (c.includes("buriram") || c.includes("chang")) return "buriram";
  if (c.includes("albert park")) return "albertpark";
  if (c.includes("red bull ring") || c.includes("spielberg")) return "redbullring";
  if (c.includes("yas marina")) return "yasmarina";
  if (c.includes("imola")) return "imola";
  return "default";
}

function TrackSVG({ circuit, color, size=140 }) {
  const key = getTrackKey(circuit);
  const paths = TRACK_SVGS[key] || TRACK_SVGS.default;
  const svg = `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
    ${paths.replace(/COLOR/g, color)}
    <circle cx="30" cy="108" r="3.5" fill="${color}"/>
  </svg>`;
  return <div style={{ width:size, height:size*0.8 }} dangerouslySetInnerHTML={{ __html: svg }}/>;
}

// ── Circuit info ──────────────────────────────────────────────────────────
const CIRCUIT_INFO = {
  monaco:       { lap:"3.337 km", turns:19, record:"1:12.909 – Hamilton (2021)", first:"F1: 1950" },
  silverstone:  { lap:"5.891 km", turns:18, record:"1:27.097 – Hamilton (2020)", first:"F1: 1950" },
  monza:        { lap:"5.793 km", turns:11, record:"1:21.046 – Barrichello (2004)", first:"F1: 1950" },
  spa:          { lap:"7.004 km", turns:20, record:"1:41.252 – Bottas (2018)", first:"F1: 1950" },
  suzuka:       { lap:"5.807 km", turns:18, record:"1:30.983 – Hamilton (2019)", first:"F1: 1987" },
  lemans:       { lap:"13.626 km", turns:38, record:"3:14.791 – Kobayashi (2017)", first:"24H: 1923" },
  paulricard:   { lap:"5.771 km", turns:15, record:"1:32.740 – Hamilton (2018)", first:"F1: 1971 · MotoGP: 1999" },
  catalunya:    { lap:"4.657 km", turns:16, record:"1:16.166 – Hamilton (2021)", first:"F1: 1991 · MotoGP: 1992" },
  jerez:        { lap:"4.423 km", turns:13, record:"1:36.825 – Marquez (2014)", first:"MotoGP: 1992" },
  mugello:      { lap:"5.245 km", turns:15, record:"1:45.996 – Marquez (2019)", first:"MotoGP: 1994" },
  buriram:      { lap:"4.554 km", turns:12, record:"1:30.630 – Mir (2019)", first:"MotoGP: 2018" },
  albertpark:   { lap:"5.278 km", turns:16, record:"1:20.235 – Bottas (2019)", first:"F1: 1996" },
  redbullring:  { lap:"4.318 km", turns:10, record:"1:05.619 – Hamilton (2020)", first:"F1: 1970" },
  yasmarina:    { lap:"5.281 km", turns:16, record:"1:26.103 – Verstappen (2021)", first:"F1: 2009" },
  imola:        { lap:"4.909 km", turns:19, record:"1:15.484 – Hamilton (2020)", first:"F1: 1980 · WEC: 2022" },
  default:      { lap:"—", turns:"—", record:"—", first:"—" },
};

// ── Helpers ───────────────────────────────────────────────────────────────
const MONTHS_FR = ["Jan","Fév","Mar","Avr","Mai","Jun","Jul","Aoû","Sep","Oct","Nov","Déc"];
function fmtDate(d) { if (!d) return ""; const x = new Date(d+"T12:00:00"); return `${x.getDate()} ${MONTHS_FR[x.getMonth()]}`; }
function fmtRange(s, e) {
  if (!s) return "";
  if (!e||s===e) return fmtDate(s);
  const a=new Date(s+"T12:00:00"), b=new Date(e+"T12:00:00");
  if (a.getMonth()===b.getMonth()) return `${a.getDate()}–${b.getDate()} ${MONTHS_FR[a.getMonth()]}`;
  return `${fmtDate(s)} → ${fmtDate(e)}`;
}
function daysUntil(d) {
  if (!d) return null;
  const t=new Date(); t.setHours(0,0,0,0);
  const x=new Date(d+"T00:00:00"); x.setHours(0,0,0,0);
  return Math.ceil((x-t)/86400000);
}

function Spinner({ color }) {
  return <div style={{ display:"flex", justifyContent:"center", padding:"40px 0" }}>
    <div style={{ width:28, height:28, borderRadius:"50%", border:`3px solid ${color}30`, borderTop:`3px solid ${color}`, animation:"spin .7s linear infinite" }}/>
  </div>;
}

// ── Circuit Detail Panel ──────────────────────────────────────────────────
function CircuitPanel({ race, id, onClose }) {
  const [results, setResults] = useState([]);
  const [loadingR, setLoadingR] = useState(true);
  const trackKey = getTrackKey(race.circuit);
  const info = CIRCUIT_INFO[trackKey] || CIRCUIT_INFO.default;
  const MEDALS = ["🥇","🥈","🥉"];

  useEffect(() => {
    if (race.status==="done") {
      sb(`results?race_id=eq.${race.id}&order=position.asc`).then(r => { setResults(r); setLoadingR(false); }).catch(()=>setLoadingR(false));
    } else setLoadingR(false);
  }, [race.id]);

  return (
    <div style={{ background:"#FAFAFA", border:`1.5px solid ${id.color}30`, borderTop:"none", borderRadius:"0 0 12px 12px", overflow:"hidden", animation:"slideDown .2s ease" }}>
      {/* Header coloré */}
      <div style={{ background:`linear-gradient(135deg,${id.color},${id.color}BB)`, padding:"12px 16px", display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <Flag country={race.country} size={24}/>
          <div>
            <div style={{ fontSize:16, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
            <div style={{ fontSize:10, color:"rgba(255,255,255,.7)", marginTop:1 }}>{race.circuit}</div>
          </div>
        </div>
        <button onClick={onClose} style={{ background:"rgba(255,255,255,.2)", border:"none", color:"#fff", width:26, height:26, borderRadius:6, cursor:"pointer", fontSize:13, display:"flex", alignItems:"center", justifyContent:"center" }}>✕</button>
      </div>

      <div style={{ padding:"12px 16px", display:"grid", gridTemplateColumns:"1fr 1fr", gap:10 }}>
        {/* Tracé */}
        <div style={{ background:"#fff", borderRadius:10, border:`1px solid ${id.color}15`, padding:12, display:"flex", flexDirection:"column", alignItems:"center" }}>
          <div style={{ fontSize:9, color:"#BBB", letterSpacing:1.5, marginBottom:6, fontWeight:700 }}>TRACÉ</div>
          <TrackSVG circuit={race.circuit} color={id.color} size={130}/>
        </div>

        {/* Infos */}
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {[
            ["📏", "Longueur", info.lap],
            ["↩️", "Virages", info.turns !== "—" ? `${info.turns}` : "—"],
            ["⏱️", "Record tour", info.record],
            ["📅", "Date", fmtRange(race.date_start, race.date_end)],
            ["🗓️", "Au calendrier", info.first],
          ].map(([emoji, label, val]) => (
            <div key={label} style={{ background:"#fff", borderRadius:8, border:"1px solid #F0F0F0", padding:"6px 9px", display:"flex", alignItems:"flex-start", gap:7 }}>
              <span style={{ fontSize:13, flexShrink:0, marginTop:1 }}>{emoji}</span>
              <div style={{ flex:1, minWidth:0 }}>
                <div style={{ fontSize:8, color:"#CCC", letterSpacing:1, fontWeight:700 }}>{label.toUpperCase()}</div>
                <div style={{ fontSize:11, fontWeight:700, color:"#222", fontFamily:"'Barlow Condensed',sans-serif", lineHeight:1.3 }}>{val}</div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Résultats ou countdown */}
      {race.status==="done" ? (
        <div style={{ padding:"0 16px 12px" }}>
          <div style={{ fontSize:9, fontWeight:700, color:"#BBB", letterSpacing:1.5, marginBottom:7 }}>RÉSULTATS</div>
          {loadingR && <Spinner color={id.color}/>}
          {!loadingR && results.length===0 && <div style={{ textAlign:"center", color:"#DDD", fontSize:12, padding:"8px 0" }}>Pas encore de résultats</div>}
          {!loadingR && results.length>0 && (
            <div style={{ display:"flex", flexDirection:"column", gap:4 }}>
              {results.map((r,i) => (
                <div key={i} style={{ display:"flex", alignItems:"center", gap:9, padding:"7px 9px", background:i===0?id.bg:"#fff", border:`1px solid ${i===0?id.color+"30":"#F0F0F0"}`, borderRadius:8 }}>
                  <div style={{ width:25, height:25, borderRadius:6, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?12:10, fontWeight:800, color:i<3?"#fff":"#AAA", flexShrink:0 }}>
                    {i<3?MEDALS[i]:r.position}
                  </div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div style={{ fontSize:13, fontWeight:700, color:i===0?id.text:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.driver}</div>
                    {r.team&&<div style={{ fontSize:9, color:"#BBB" }}>{r.team}</div>}
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    {r.points>0&&<div style={{ fontSize:12, fontWeight:800, color:id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>{r.points} pts</div>}
                    {r.gap&&<div style={{ fontSize:9, color:"#CCC" }}>{r.gap}</div>}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      ) : (
        <div style={{ padding:"0 16px 12px" }}>
          <div style={{ background:id.bg, borderRadius:10, padding:"10px 14px", border:`1px dashed ${id.color}40`, display:"flex", alignItems:"center", justifyContent:"center", gap:10 }}>
            <Flag country={race.country} size={20}/>
            <div style={{ fontSize:13, color:id.text, fontWeight:700 }}>
              {daysUntil(race.date_start)===0 ? "C'est aujourd'hui !" : `Dans ${daysUntil(race.date_start)} jours`}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ── Standings ─────────────────────────────────────────────────────────────
function StandingsPanel({ seriesId, id }) {
  const [tab, setTab] = useState("driver");
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    setLoading(true);
    sb(`standings?series_id=eq.${seriesId}&type=eq.${tab}&season=eq.2026&order=position.asc`).then(r=>{setData(r);setLoading(false);}).catch(()=>setLoading(false));
  }, [seriesId, tab]);
  const maxPts = data[0]?.points||1;
  return (
    <div>
      <div style={{ display:"flex", gap:6, marginBottom:12 }}>
        {[["driver","Pilotes"],["team","Équipes"]].map(([v,l])=>(
          <button key={v} onClick={()=>setTab(v)} style={{ padding:"6px 16px", borderRadius:20, border:`1.5px solid ${tab===v?id.color:"#E8E8E8"}`, background:tab===v?id.color:"#fff", color:tab===v?"#fff":"#888", fontSize:12, fontWeight:700, cursor:"pointer", fontFamily:"inherit" }}>{l}</button>
        ))}
      </div>
      {loading&&<Spinner color={id.color}/>}
      {!loading&&data.length===0&&<div style={{ textAlign:"center", color:"#DDD", fontSize:13, padding:"30px 0" }}>Classement pas encore disponible</div>}
      {!loading&&data.length>0&&(
        <div style={{ display:"flex", flexDirection:"column", gap:5 }}>
          {data.map((s,i)=>(
            <div key={i} style={{ background:"#fff", border:`1.5px solid ${i===0?id.color+"60":"#EFEFEF"}`, borderLeft:`4px solid ${i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E8E8E8"}`, borderRadius:10, padding:"9px 12px", display:"flex", alignItems:"center", gap:10 }}>
              <div style={{ fontSize:17, fontWeight:900, color:i===0?id.color:i<3?"#888":"#DDD", minWidth:26, textAlign:"center", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.position}</div>
              <div style={{ flex:1, minWidth:0 }}>
                <div style={{ fontSize:13, fontWeight:700, color:i===0?"#111":"#333", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.name}</div>
                {s.nationality&&<div style={{ fontSize:10, color:"#AAA" }}>{s.nationality}</div>}
                <div style={{ marginTop:4, height:3, background:"#F0F0F0", borderRadius:2, overflow:"hidden" }}>
                  <div style={{ height:"100%", width:`${Math.round((s.points/maxPts)*100)}%`, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E0E0E0", borderRadius:2 }}/>
                </div>
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                <div style={{ fontSize:20, fontWeight:900, lineHeight:1, color:i===0?id.color:"#CCC", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.points}</div>
                <div style={{ fontSize:8, color:"#CCC", letterSpacing:1, fontWeight:600 }}>PTS</div>
                {s.wins>0&&<div style={{ fontSize:10, color:id.color, fontWeight:700 }}>{s.wins}V</div>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Race Card ─────────────────────────────────────────────────────────────
function RaceCard({ race, id, active, onClick }) {
  const today = new Date().toISOString().slice(0,10);
  const done = race.status==="done";
  const live = race.status==="live";
  const days = daysUntil(race.date_start);
  return (
    <div onClick={()=>onClick(race)} style={{
      display:"flex", alignItems:"center",
      background:active?`${id.color}08`:"#FFFFFF",
      border:`1.5px solid ${active?id.color:live?id.color:"#E8E8E8"}`,
      borderLeft:`4px solid ${live?id.color:done?"#D0D0D0":id.color}`,
      borderRadius:active?"12px 12px 0 0":12,
      cursor:"pointer", transition:"all .15s", overflow:"hidden",
      opacity:done&&!race._hasResults?0.5:1,
    }}>
      {/* Date block avec drapeau */}
      <div style={{ minWidth:58, padding:"10px 4px", background:live?id.color:done?"#F5F5F5":id.bg, display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", flexShrink:0, gap:3 }}>
        <Flag country={race.country} size={18}/>
        <div style={{ fontSize:17, fontWeight:900, lineHeight:1, color:live?"#fff":done?"#AAA":id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>
          {new Date(race.date_start+"T12:00:00").getDate()}
        </div>
        <div style={{ fontSize:8, fontWeight:600, letterSpacing:1, textTransform:"uppercase", color:live?"#ffffff99":done?"#BBB":id.text }}>
          {MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}
        </div>
      </div>

      <div style={{ flex:1, padding:"9px 11px", minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:5, marginBottom:2, flexWrap:"wrap" }}>
          {live&&<span style={{ fontSize:8, fontWeight:700, letterSpacing:1.5, color:"#fff", background:id.color, padding:"2px 6px", borderRadius:4, animation:"pulse 1.4s infinite" }}>LIVE</span>}
          {race.type==="sprint"&&<span style={{ fontSize:8, fontWeight:700, color:"#FF6B00", background:"#FFF0E0", padding:"2px 6px", borderRadius:4 }}>SPRINT</span>}
          {race.type==="sprint_weekend"&&race.series_id==="MotoGP"&&<span style={{ fontSize:8, fontWeight:600, color:"#888", background:"#F2F2F2", padding:"2px 6px", borderRadius:4 }}>+ SPRINT SAM.</span>}
          {race.type==="sprint_weekend"&&race.series_id==="F1"&&<span style={{ fontSize:8, fontWeight:700, color:id.color, background:id.bg, padding:"2px 6px", borderRadius:4 }}>SPRINT WE</span>}
          {done&&race._hasResults&&<span style={{ fontSize:8, fontWeight:600, color:id.text, background:id.bg, padding:"2px 6px", borderRadius:4 }}>RÉSULTATS ↓</span>}
          {race.type!=="sprint"&&race.type!=="sprint_weekend"&&race.round&&<span style={{ fontSize:9, color:"#CCC", fontWeight:600 }}>R{race.round}</span>}
        </div>
        <div style={{ fontSize:14, fontWeight:700, color:done?"#999":"#111", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
        <div style={{ fontSize:10, color:"#BBB", marginTop:1, whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis" }}>{race.circuit}</div>
      </div>

      {!done&&days!==null&&(
        <div style={{ padding:"0 10px", textAlign:"center", flexShrink:0 }}>
          {days===0?<div style={{ fontSize:10, fontWeight:800, color:id.color }}>AUJ.</div>
            :days>0?<><div style={{ fontSize:days<=99?20:14, fontWeight:900, color:days<=7?id.color:"#DDD", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{days}</div><div style={{ fontSize:8, color:"#DDD", letterSpacing:1, fontWeight:600 }}>J</div></>:null}
        </div>
      )}
      <div style={{ padding:"0 8px", color:active?id.color:"#DDD", fontSize:12, flexShrink:0 }}>{active?"▲":"▼"}</div>
    </div>
  );
}

// ── App ───────────────────────────────────────────────────────────────────
export default function App() {
  const [series, setSeries] = useState([]);
  const [active, setActive] = useState("F1");
  const [races, setRaces] = useState([]);
  const [filter, setFilter] = useState("upcoming");
  const [loading, setLoading] = useState(true);
  const [selected, setSelected] = useState(null);
  const today = new Date().toISOString().slice(0,10);
  const id = SERIES_ID[active]||SERIES_ID.F1;

  useEffect(()=>{ sb("series?order=id.asc").then(setSeries).catch(console.error); },[]);

  useEffect(()=>{
    setLoading(true); setSelected(null);
    sb(`races?series_id=eq.${active}&order=date_start.asc,type.asc`).then(async r=>{
      const doneIds = r.filter(x=>x.status==="done").map(x=>x.id);
      if (doneIds.length>0) {
        const res = await sb(`results?race_id=in.(${doneIds.join(",")})&select=race_id`).catch(()=>[]);
        const withRes = new Set(res.map(x=>x.race_id));
        r = r.map(x=>({...x, _hasResults:withRes.has(x.id)}));
      }
      setRaces(r); setLoading(false);
    }).catch(()=>setLoading(false));
  },[active]);

  const displayed = filter==="upcoming"?races.filter(r=>r.date_end>=today)
    :filter==="results"?races.filter(r=>r.status==="done").reverse():races;
  const next = races.find(r=>r.date_start>=today&&r.status!=="done"&&r.type!=="sprint");
  const dNext = next?daysUntil(next.date_start):null;
  const doneCount = races.filter(r=>r.status==="done"&&r.type!=="sprint").length;
  const totalCount = races.filter(r=>r.type!=="sprint").length;

  return (
    <div style={{ minHeight:"100vh", background:"#F4F4F4", fontFamily:"'Barlow Condensed','Arial Narrow',sans-serif", paddingBottom:60 }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;500;600;700;800;900&display=swap');
        @keyframes spin{to{transform:rotate(360deg)}}
        @keyframes pulse{0%,100%{opacity:1}50%{opacity:.5}}
        @keyframes slideUp{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:none}}
        @keyframes slideDown{from{opacity:0;transform:translateY(-6px)}to{opacity:1;transform:none}}
        *{box-sizing:border-box} button{font-family:inherit}
      `}</style>

      {/* Header */}
      <div style={{ position:"sticky", top:0, zIndex:20, background:"#fff", borderBottom:"1.5px solid #EFEFEF" }}>
        <div style={{ maxWidth:600, margin:"0 auto", padding:"0 16px" }}>
          <div style={{ height:4, background:id.color, margin:"0 -16px" }}/>
          <div style={{ padding:"10px 0 0", display:"flex", alignItems:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", right:-5, top:-8, fontSize:72, opacity:.07, userSelect:"none" }}>{id.heroEmoji}</div>
            <div>
              <div style={{ fontSize:10, fontWeight:700, letterSpacing:3, color:"#BBB" }}>CALENDRIER</div>
              <div style={{ fontSize:21, fontWeight:900, color:"#111" }}>MOTORSPORT <span style={{ color:id.color }}>2026</span></div>
            </div>
          </div>
          <div style={{ display:"flex", marginTop:10, overflowX:"auto", scrollbarWidth:"none", borderBottom:"1.5px solid #F0F0F0" }}>
            {series.map(s=>{
              const sid=SERIES_ID[s.id]||{};
              const isA=active===s.id;
              return <button key={s.id} onClick={()=>setActive(s.id)} style={{ padding:"7px 13px", border:"none", borderBottom:`3px solid ${isA?sid.color:"transparent"}`, background:"transparent", color:isA?sid.color:"#CCC", fontSize:11, fontWeight:isA?800:600, letterSpacing:.5, cursor:"pointer", whiteSpace:"nowrap", transition:"all .15s" }}>
                {sid.icon} {s.id}
              </button>;
            })}
          </div>
        </div>
      </div>

      <div style={{ maxWidth:600, margin:"0 auto", padding:"0 14px" }}>
        {/* Next race */}
        {next&&!loading&&(
          <div style={{ margin:"14px 0 10px", background:`linear-gradient(135deg,${id.color},${id.color}CC)`, borderRadius:14, padding:"14px 16px", display:"flex", justifyContent:"space-between", alignItems:"center", boxShadow:`0 4px 20px ${id.color}30`, animation:"slideUp .3s ease", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", right:14, top:"50%", transform:"translateY(-50%)", opacity:.15 }}>
              <Flag country={next.country} size={60}/>
            </div>
            <div>
              <div style={{ fontSize:8, fontWeight:700, letterSpacing:2.5, color:"rgba(255,255,255,.65)", marginBottom:3 }}>PROCHAINE COURSE</div>
              <div style={{ fontSize:17, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{next.name}</div>
              <div style={{ display:"flex", alignItems:"center", gap:6, marginTop:3 }}>
                <Flag country={next.country} size={14}/>
                <span style={{ fontSize:10, color:"rgba(255,255,255,.65)" }}>{fmtRange(next.date_start,next.date_end)}{next.circuit?` · ${next.circuit}`:""}</span>
              </div>
            </div>
            <div style={{ textAlign:"right", zIndex:1 }}>
              {dNext===0?<div style={{ fontSize:11, fontWeight:900, color:"#fff" }}>AUJOURD'HUI</div>
                :<><div style={{ fontSize:40, fontWeight:900, color:"#fff", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{dNext}</div><div style={{ fontSize:9, color:"rgba(255,255,255,.6)", letterSpacing:2, fontWeight:600 }}>JOURS</div></>}
            </div>
          </div>
        )}

        {/* Progress */}
        {!loading&&totalCount>0&&(
          <div style={{ marginBottom:10 }}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:3 }}>
              <span style={{ fontSize:9, color:"#BBB", fontWeight:600 }}>SAISON 2026 — {doneCount}/{totalCount} GP</span>
              <span style={{ fontSize:9, color:id.color, fontWeight:700 }}>{Math.round((doneCount/totalCount)*100)}%</span>
            </div>
            <div style={{ height:3, background:"#E8E8E8", borderRadius:2, overflow:"hidden" }}>
              <div style={{ height:"100%", width:`${Math.round((doneCount/totalCount)*100)}%`, background:`linear-gradient(90deg,${id.color},${id.color}99)`, borderRadius:2, transition:"width .5s" }}/>
            </div>
          </div>
        )}

        {/* Tabs */}
        <div style={{ display:"flex", gap:4, marginBottom:10, padding:"4px", background:"#E8E8E8", borderRadius:10 }}>
          {[["upcoming","À venir"],["all","Calendrier"],["results","Résultats"],["standings","Classement"]].map(([v,l])=>(
            <button key={v} onClick={()=>setFilter(v)} style={{ flex:1, padding:"6px 0", borderRadius:7, border:"none", background:filter===v?"#fff":"transparent", color:filter===v?id.color:"#AAA", fontSize:10, fontWeight:filter===v?800:600, cursor:"pointer", boxShadow:filter===v?"0 1px 4px rgba(0,0,0,0.08)":"none", transition:"all .15s" }}>{l}</button>
          ))}
        </div>

        {loading&&<Spinner color={id.color}/>}
        {!loading&&filter==="standings"&&<div style={{ animation:"slideUp .25s ease" }}><StandingsPanel seriesId={active} id={id}/></div>}
        {!loading&&filter!=="standings"&&(
          <div style={{ display:"flex", flexDirection:"column", gap:5, animation:"slideUp .25s ease" }}>
            {displayed.length===0&&<div style={{ textAlign:"center", color:"#CCC", fontSize:13, padding:40 }}>Aucune course</div>}
            {displayed.map(race=>(
              <div key={race.id}>
                <RaceCard race={race} id={id} active={selected?.id===race.id} onClick={r=>setSelected(selected?.id===r.id?null:r)}/>
                {selected?.id===race.id&&<CircuitPanel race={race} id={id} onClose={()=>setSelected(null)}/>}
              </div>
            ))}
          </div>
        )}
        {!loading&&<div style={{ marginTop:18, padding:"9px 12px", background:"#fff", borderRadius:10, border:"1.5px solid #EFEFEF", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
          <span style={{ fontSize:9, color:"#CCC", fontWeight:600, letterSpacing:1 }}>{races.length} COURSES · SUPABASE</span>
          <span style={{ fontSize:9, fontWeight:800, color:id.color }}>{id.label.toUpperCase()} 2026</span>
        </div>}
      </div>
    </div>
  );
}
