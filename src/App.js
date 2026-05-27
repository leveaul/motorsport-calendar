import { useState, useEffect } from "react";

const SUPABASE_URL = "https://qgdcutklhgnlcrxuvgkn.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnZGN1dGtsaGdubGNyeHV2Z2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4NzQ0NjAsImV4cCI6MjA5NTQ1MDQ2MH0.ltV5jlQfoF4OS6078lwwRAV-q-IDN7biLzHzM1tkUI8";
const H = { "apikey": SUPABASE_KEY, "Authorization": `Bearer ${SUPABASE_KEY}` };
async function sb(path) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, { headers: H });
  if (!r.ok) throw new Error(await r.text());
  return r.json();
}

// ── Series identity ────────────────────────────────────────────────────────
const SERIES_ID = {
  F1:    { label:"Formula 1",     color:"#E8002D", bg:"#FFF0F2", text:"#B0001F", icon:"🏎️",
           bgImage:"https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/2022_Formula_One_season_logo.svg/400px-2022_Formula_One_season_logo.svg.png",
           heroEmoji:"🏎️", heroLabel:"FORMULA 1" },
  MotoGP:{ label:"MotoGP",        color:"#D50032", bg:"#FFF0F1", text:"#A50027", icon:"🏍️",
           heroEmoji:"🏍️", heroLabel:"MOTOGP" },
  WEC:   { label:"FIA WEC",       color:"#0066CC", bg:"#EFF6FF", text:"#004A9E", icon:"⏱️",
           heroEmoji:"⏱️", heroLabel:"FIA WEC" },
  ELMS:  { label:"ELMS",          color:"#00833E", bg:"#EDFAF3", text:"#006030", icon:"🏁",
           heroEmoji:"🏁", heroLabel:"ELMS" },
  IMSA:  { label:"IMSA",          color:"#0033A0", bg:"#EEF2FF", text:"#002280", icon:"🇺🇸",
           heroEmoji:"🏆", heroLabel:"IMSA" },
  GTWCE: { label:"GT WC Europe",  color:"#FF6600", bg:"#FFF4EE", text:"#CC4400", icon:"🏆",
           heroEmoji:"🏆", heroLabel:"GT WORLD CHALLENGE" },
};

// ── Country flags ──────────────────────────────────────────────────────────
const FLAGS = {
  "Australie":"🇦🇺","Chine":"🇨🇳","Japon":"🇯🇵","États-Unis":"🇺🇸","Canada":"🇨🇦",
  "Monaco":"🇲🇨","Espagne":"🇪🇸","Autriche":"🇦🇹","Angleterre":"🇬🇧","Belgique":"🇧🇪",
  "Hongrie":"🇭🇺","Pays-Bas":"🇳🇱","Italie":"🇮🇹","Azerbaïdjan":"🇦🇿","Singapour":"🇸🇬",
  "Mexique":"🇲🇽","Brésil":"🇧🇷","Qatar":"🇶🇦","Abu Dhabi":"🇦🇪","Bahreïn":"🇧🇭",
  "Thaïlande":"🇹🇭","Indonésie":"🇮🇩","Malaisie":"🇲🇾","France":"🇫🇷","Portugal":"🇵🇹",
  "Allemagne":"🇩🇪","Rép. Tchèque":"🇨🇿","Argentine":"🇦🇷","Afrique du Sud":"🇿🇦",
  "Grande-Bretagne":"🇬🇧","Suède":"🇸🇪",
};

// ── Circuit data (tracé SVG path + infos) ─────────────────────────────────
const CIRCUIT_DATA = {
  "Circuit de Monaco": {
    lap: "3.337 km", turns: 19, record: "1:12.909 – Hamilton (2021)",
    first_f1: 1950, country: "🇲🇨",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M40 130 L40 100 Q40 80 55 70 L80 55 Q95 45 110 48 L140 55 Q160 62 165 75 L165 95 Q163 110 150 118 L130 125 Q115 132 100 130 L70 128 Q55 132 40 130Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="40" cy="130" r="4" fill="COLOR"/>
    </svg>`
  },
  "Albert Park Circuit, Melbourne": {
    lap: "5.278 km", turns: 16, record: "1:20.235 – Bottas (2019)",
    first_f1: 1996, country: "🇦🇺",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M30 100 L30 70 Q32 55 50 50 L90 45 Q110 44 125 52 L155 65 Q170 75 168 90 L162 115 Q155 130 138 135 L100 138 Q70 138 55 128 L35 112 Q28 108 30 100Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="30" cy="100" r="4" fill="COLOR"/>
    </svg>`
  },
  "Autodromo Nazionale Monza": {
    lap: "5.793 km", turns: 11, record: "1:21.046 – Barrichello (2004)",
    first_f1: 1950, country: "🇮🇹",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M35 90 L35 50 Q35 35 50 32 L150 32 Q165 35 165 50 L165 90 Q165 110 150 115 L130 118 L130 95 L70 95 L70 118 L50 115 Q35 110 35 90Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="35" cy="90" r="4" fill="COLOR"/>
    </svg>`
  },
  "Silverstone Circuit": {
    lap: "5.891 km", turns: 18, record: "1:27.097 – Hamilton (2020)",
    first_f1: 1950, country: "🇬🇧",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M30 110 L30 80 Q32 65 45 58 L75 45 Q95 38 115 42 L145 52 Q163 62 166 80 L165 105 Q160 122 143 128 L110 133 Q80 135 60 127 L40 117 Q28 115 30 110Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="30" cy="110" r="4" fill="COLOR"/>
    </svg>`
  },
  "Circuit de Spa-Francorchamps": {
    lap: "7.004 km", turns: 20, record: "1:41.252 – Bottas (2018)",
    first_f1: 1950, country: "🇧🇪",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M25 120 L25 85 Q27 65 45 55 L70 40 Q90 32 110 38 L145 50 Q168 62 170 80 L168 105 Q162 125 142 132 L105 138 Q75 140 52 130 L32 122 Q23 120 25 120Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <path d="M70 40 L90 75 L110 38" stroke="COLOR" stroke-width="3" fill="none" stroke-linecap="round"/>
      <circle cx="25" cy="120" r="4" fill="COLOR"/>
    </svg>`
  },
  "Suzuka International Racing Course": {
    lap: "5.807 km", turns: 18, record: "1:30.983 – Hamilton (2019)",
    first_f1: 1987, country: "🇯🇵",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M30 100 L30 65 Q32 48 50 42 L85 35 Q100 33 112 40 L130 55 Q145 68 140 85 L125 95 Q110 102 95 95 L80 85 Q70 75 75 62 L90 50" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <path d="M140 85 L150 100 Q158 115 150 128 L130 135 Q108 140 88 135 L60 125 Q38 115 30 100" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round"/>
      <circle cx="30" cy="100" r="4" fill="COLOR"/>
    </svg>`
  },
  "Circuit de la Sarthe, Le Mans": {
    lap: "13.626 km", turns: 38, record: "3:14.791 – Kobayashi (2017)",
    first_wec: 1923, country: "🇫🇷",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M20 130 L20 90 Q22 70 40 60 L70 48 Q90 40 115 42 L150 50 Q172 60 175 80 L172 100 Q165 118 148 125 L120 132 L120 118 L90 118 L90 132 L60 130 Q38 130 20 130Z" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="20" cy="130" r="4" fill="COLOR"/>
    </svg>`
  },
  "Circuit Bugatti, Le Mans": {
    lap: "4.185 km", turns: 14, record: "1:31.185 – Zarco (2021)",
    first_motogp: 2000, country: "🇫🇷",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M35 120 L35 85 Q37 68 55 60 L90 50 Q112 45 130 52 L158 65 Q170 77 168 95 L162 115 Q153 132 133 137 L95 140 Q65 138 48 128 L35 120Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="35" cy="120" r="4" fill="COLOR"/>
    </svg>`
  },
  "Chang International Circuit, Buriram": {
    lap: "4.554 km", turns: 12, record: "1:30.630 – Mir (2019)",
    first_motogp: 2018, country: "🇹🇭",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M30 105 L30 70 Q32 52 52 45 L95 38 Q120 36 140 46 L162 62 Q172 78 168 98 L158 120 Q146 135 122 138 L80 140 Q52 138 38 124 L30 105Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="30" cy="105" r="4" fill="COLOR"/>
    </svg>`
  },
  "Circuito de Jerez – Ángel Nieto": {
    lap: "4.428 km", turns: 13, record: "1:36.825 – Marquez (2014)",
    first_motogp: 1992, country: "🇪🇸",
    svg: `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M35 115 L35 80 Q37 62 55 55 L92 44 Q115 40 138 50 L160 65 Q172 80 168 100 L160 122 Q148 138 125 141 L82 142 Q55 140 42 126 L35 115Z" stroke="COLOR" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="35" cy="115" r="4" fill="COLOR"/>
    </svg>`
  },
};

const DEFAULT_SVG = (color) => `<svg viewBox="0 0 200 160" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M30 110 Q30 80 50 65 L90 50 Q120 42 150 58 L170 80 Q176 100 165 118 L140 132 Q110 142 80 135 L50 122 Q28 118 30 110Z" stroke="${color}" stroke-width="5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="30" cy="110" r="4" fill="${color}"/>
</svg>`;

const MONTHS_FR = ["Jan","Fév","Mar","Avr","Mai","Jun","Jul","Aoû","Sep","Oct","Nov","Déc"];
function fmtDate(d) { if (!d) return ""; const x = new Date(d+"T12:00:00"); return `${x.getDate()} ${MONTHS_FR[x.getMonth()]}`; }
function fmtRange(s, e) {
  if (!s) return "";
  if (!e || s===e) return fmtDate(s);
  const a = new Date(s+"T12:00:00"), b = new Date(e+"T12:00:00");
  if (a.getMonth()===b.getMonth()) return `${a.getDate()}–${b.getDate()} ${MONTHS_FR[a.getMonth()]}`;
  return `${fmtDate(s)} → ${fmtDate(e)}`;
}
function daysUntil(d) {
  if (!d) return null;
  const t = new Date(); t.setHours(0,0,0,0);
  const x = new Date(d+"T00:00:00"); x.setHours(0,0,0,0);
  return Math.ceil((x - t) / 86400000);
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
  const data = CIRCUIT_DATA[race.circuit] || {};
  const flag = FLAGS[race.country] || "🏁";
  const MEDALS = ["🥇","🥈","🥉"];

  useEffect(() => {
    if (race.status === "done") {
      sb(`results?race_id=eq.${race.id}&order=position.asc`).then(r => { setResults(r); setLoadingR(false); }).catch(() => setLoadingR(false));
    } else { setLoadingR(false); }
  }, [race.id]);

  const svgContent = data.svg ? data.svg.replace(/COLOR/g, id.color) : DEFAULT_SVG(id.color);

  return (
    <div style={{ background:"#FAFAFA", border:`1.5px solid ${id.color}30`, borderTop:"none", borderRadius:"0 0 12px 12px", overflow:"hidden", animation:"slideDown .25s ease" }}>
      {/* Header */}
      <div style={{ background:`linear-gradient(135deg, ${id.color}, ${id.color}CC)`, padding:"14px 16px", display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
        <div>
          <div style={{ fontSize:22, marginBottom:2 }}>{flag}</div>
          <div style={{ fontSize:16, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
          <div style={{ fontSize:11, color:"rgba(255,255,255,0.7)", marginTop:2 }}>{race.circuit}</div>
        </div>
        <button onClick={onClose} style={{ background:"rgba(255,255,255,0.2)", border:"none", color:"#fff", width:28, height:28, borderRadius:6, cursor:"pointer", fontSize:14, display:"flex", alignItems:"center", justifyContent:"center" }}>✕</button>
      </div>

      <div style={{ padding:"14px 16px", display:"grid", gridTemplateColumns:"1fr 1fr", gap:12 }}>
        {/* Tracé SVG */}
        <div style={{ background:"#fff", borderRadius:10, border:`1px solid ${id.color}20`, padding:12, display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center" }}>
          <div style={{ fontSize:10, color:"#AAA", letterSpacing:1, marginBottom:8, fontWeight:700 }}>TRACÉ</div>
          <div style={{ width:"100%", maxWidth:130 }} dangerouslySetInnerHTML={{ __html: svgContent }}/>
        </div>

        {/* Infos circuit */}
        <div style={{ display:"flex", flexDirection:"column", gap:7 }}>
          {[
            ["📏","Longueur", data.lap || "—"],
            ["↩️","Virages", data.turns ? `${data.turns} virages` : "—"],
            ["⏱️","Record", data.record || "—"],
            ["📅","Date", fmtRange(race.date_start, race.date_end)],
            [race.type==="sprint"?"🏃":"🏁","Type", race.type==="sprint" ? "Course Sprint" : race.type==="sprint_weekend" ? "Weekend Sprint" : "Grand Prix"],
          ].map(([emoji, label, val]) => (
            <div key={label} style={{ background:"#fff", borderRadius:8, border:"1px solid #F0F0F0", padding:"7px 10px", display:"flex", alignItems:"center", gap:8 }}>
              <span style={{ fontSize:14 }}>{emoji}</span>
              <div style={{ flex:1 }}>
                <div style={{ fontSize:9, color:"#BBB", letterSpacing:1, fontWeight:700 }}>{label.toUpperCase()}</div>
                <div style={{ fontSize:12, fontWeight:700, color:"#222", fontFamily:"'Barlow Condensed',sans-serif" }}>{val}</div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Résultats */}
      {race.status === "done" && (
        <div style={{ padding:"0 16px 14px" }}>
          <div style={{ fontSize:10, fontWeight:700, color:"#AAA", letterSpacing:1.5, marginBottom:8 }}>RÉSULTATS</div>
          {loadingR && <Spinner color={id.color}/>}
          {!loadingR && results.length === 0 && <div style={{ textAlign:"center", color:"#CCC", fontSize:12, padding:"10px 0" }}>Pas encore de résultats</div>}
          {!loadingR && results.length > 0 && (
            <div style={{ display:"flex", flexDirection:"column", gap:4 }}>
              {results.map((r, i) => (
                <div key={i} style={{ display:"flex", alignItems:"center", gap:10, padding:"7px 10px", background: i===0?id.bg:"#fff", border:`1px solid ${i===0?id.color+"30":"#F0F0F0"}`, borderRadius:8 }}>
                  <div style={{ width:26, height:26, borderRadius:6, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?13:10, fontWeight:800, color:i<3?"#fff":"#AAA", flexShrink:0 }}>
                    {i<3 ? MEDALS[i] : r.position}
                  </div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div style={{ fontSize:13, fontWeight:700, color:i===0?id.text:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.driver}</div>
                    {r.team && <div style={{ fontSize:10, color:"#BBB" }}>{r.team}</div>}
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    {r.points>0 && <div style={{ fontSize:12, fontWeight:800, color:id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>{r.points} pts</div>}
                    {r.gap && <div style={{ fontSize:9, color:"#CCC" }}>{r.gap}</div>}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}

      {race.status !== "done" && (
        <div style={{ padding:"0 16px 14px", textAlign:"center" }}>
          <div style={{ background:id.bg, borderRadius:10, padding:"12px", border:`1px dashed ${id.color}40` }}>
            <div style={{ fontSize:24, marginBottom:4 }}>{flag}</div>
            <div style={{ fontSize:12, color:id.text, fontWeight:700 }}>
              {daysUntil(race.date_start) === 0 ? "Aujourd'hui !" : `Dans ${daysUntil(race.date_start)} jours`}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ── Standings Panel ───────────────────────────────────────────────────────
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
          <button key={v} onClick={() => setTab(v)} style={{ padding:"6px 16px", borderRadius:20, border:`1.5px solid ${tab===v?id.color:"#E8E8E8"}`, background:tab===v?id.color:"#fff", color:tab===v?"#fff":"#888", fontSize:12, fontWeight:700, cursor:"pointer", fontFamily:"inherit" }}>{l}</button>
        ))}
      </div>
      {loading && <Spinner color={id.color}/>}
      {!loading && data.length===0 && <div style={{ textAlign:"center", color:"#DDD", fontSize:13, padding:"30px 0" }}>Classement pas encore disponible</div>}
      {!loading && data.length>0 && (
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {data.map((s, i) => (
            <div key={i} style={{ background:"#fff", border:`1.5px solid ${i===0?id.color+"60":"#EFEFEF"}`, borderLeft:`4px solid ${i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E8E8E8"}`, borderRadius:10, padding:"10px 14px", display:"flex", alignItems:"center", gap:12 }}>
              <div style={{ fontSize:18, fontWeight:900, color:i===0?id.color:i<3?"#888":"#DDD", minWidth:28, textAlign:"center", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.position}</div>
              <div style={{ flex:1, minWidth:0 }}>
                <div style={{ fontSize:14, fontWeight:700, color:i===0?"#111":"#333", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.name}</div>
                {s.nationality && <div style={{ fontSize:10, color:"#AAA" }}>{s.nationality}</div>}
                <div style={{ marginTop:5, height:3, background:"#F0F0F0", borderRadius:2, overflow:"hidden" }}>
                  <div style={{ height:"100%", width:`${Math.round((s.points/maxPts)*100)}%`, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E0E0E0", borderRadius:2 }}/>
                </div>
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                <div style={{ fontSize:22, fontWeight:900, lineHeight:1, color:i===0?id.color:"#CCC", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.points}</div>
                <div style={{ fontSize:9, color:"#CCC", letterSpacing:1, fontWeight:600 }}>PTS</div>
                {s.wins>0 && <div style={{ fontSize:10, color:id.color, fontWeight:700, marginTop:2 }}>{s.wins}V</div>}
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
  const flag = FLAGS[race.country] || "";
  return (
    <div onClick={() => onClick(race)} style={{
      display:"flex", alignItems:"center",
      background: active?`${id.color}08`:"#FFFFFF",
      border:`1.5px solid ${active?id.color:live?id.color:"#E8E8E8"}`,
      borderLeft:`4px solid ${live?id.color:done?"#D0D0D0":id.color}`,
      borderRadius:active?"12px 12px 0 0":12,
      cursor:"pointer", transition:"all .15s", overflow:"hidden",
      opacity: done&&!race._hasResults?0.5:1,
    }}>
      <div style={{ minWidth:56, padding:"12px 0", background:live?id.color:done?"#F5F5F5":id.bg, display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", flexShrink:0 }}>
        <div style={{ fontSize:16, lineHeight:1, marginBottom:1 }}>{flag}</div>
        <div style={{ fontSize:16, fontWeight:900, lineHeight:1, color:live?"#fff":done?"#AAAAAA":id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>
          {new Date(race.date_start+"T12:00:00").getDate()}
        </div>
        <div style={{ fontSize:9, fontWeight:600, letterSpacing:1, textTransform:"uppercase", color:live?"#ffffff99":done?"#BBBBBB":id.text }}>
          {MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}
        </div>
      </div>
      <div style={{ flex:1, padding:"10px 12px", minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:2, flexWrap:"wrap" }}>
          {live && <span style={{ fontSize:9, fontWeight:700, letterSpacing:1.5, color:"#fff", background:id.color, padding:"2px 7px", borderRadius:4, animation:"pulse 1.4s infinite" }}>LIVE</span>}
          {race.type==="sprint" && <span style={{ fontSize:9, fontWeight:700, color:"#FF6B00", background:"#FFF0E0", padding:"2px 6px", borderRadius:4 }}>SPRINT</span>}
          {race.type==="sprint_weekend"&&race.series_id==="MotoGP" && <span style={{ fontSize:9, fontWeight:600, color:"#888", background:"#F2F2F2", padding:"2px 6px", borderRadius:4 }}>+ SPRINT SAM.</span>}
          {race.type==="sprint_weekend"&&race.series_id==="F1" && <span style={{ fontSize:9, fontWeight:700, color:id.color, background:id.bg, padding:"2px 6px", borderRadius:4 }}>SPRINT WE</span>}
          {done&&race._hasResults && <span style={{ fontSize:9, fontWeight:600, color:id.text, background:id.bg, padding:"2px 6px", borderRadius:4 }}>RÉSULTATS ↓</span>}
          {(race.type!=="sprint"&&race.type!=="sprint_weekend")&&race.round && <span style={{ fontSize:10, color:"#AAAAAA", fontWeight:600 }}>R{race.round}</span>}
        </div>
        <div style={{ fontSize:14, fontWeight:700, color:done?"#999":"#111", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
        <div style={{ fontSize:11, color:"#AAAAAA", marginTop:1, whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis" }}>{race.circuit}</div>
      </div>
      {!done&&days!==null&&(
        <div style={{ padding:"0 14px", textAlign:"center", flexShrink:0 }}>
          {days===0?<div style={{ fontSize:11, fontWeight:800, color:id.color }}>AUJ.</div>
            :days>0?<><div style={{ fontSize:days<=99?22:16, fontWeight:900, color:days<=7?id.color:"#CCCCCC", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{days}</div><div style={{ fontSize:9, color:"#CCCCCC", letterSpacing:1, fontWeight:600 }}>J</div></>:null}
        </div>
      )}
      <div style={{ padding:"0 10px", color:active?id.color:"#DDD", fontSize:14, flexShrink:0 }}>{active?"▲":"▼"}</div>
    </div>
  );
}

// ── Main App ──────────────────────────────────────────────────────────────
export default function App() {
  const [series, setSeries] = useState([]);
  const [active, setActive] = useState("F1");
  const [races, setRaces] = useState([]);
  const [filter, setFilter] = useState("upcoming");
  const [loading, setLoading] = useState(true);
  const [selected, setSelected] = useState(null);

  const today = new Date().toISOString().slice(0,10);
  const id = SERIES_ID[active] || SERIES_ID.F1;

  useEffect(() => { sb("series?order=id.asc").then(setSeries).catch(console.error); }, []);

  useEffect(() => {
    setLoading(true); setSelected(null);
    sb(`races?series_id=eq.${active}&order=date_start.asc,type.asc`).then(async r => {
      const doneIds = r.filter(x => x.status==="done").map(x => x.id);
      if (doneIds.length>0) {
        const res = await sb(`results?race_id=in.(${doneIds.join(",")})&select=race_id`).catch(()=>[]);
        const withRes = new Set(res.map(x => x.race_id));
        r = r.map(x => ({ ...x, _hasResults: withRes.has(x.id) }));
      }
      setRaces(r); setLoading(false);
    }).catch(()=>setLoading(false));
  }, [active]);

  const displayed = filter==="upcoming" ? races.filter(r => r.date_end>=today)
    : filter==="results" ? races.filter(r => r.status==="done").reverse() : races;
  const next = races.find(r => r.date_start>=today && r.status!=="done" && r.type!=="sprint");
  const dNext = next ? daysUntil(next.date_start) : null;
  const doneCount = races.filter(r => r.status==="done" && r.type!=="sprint").length;
  const totalCount = races.filter(r => r.type!=="sprint").length;

  return (
    <div style={{ minHeight:"100vh", background:"#F4F4F4", color:"#111", fontFamily:"'Barlow Condensed','Arial Narrow',sans-serif", paddingBottom:60 }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;500;600;700;800;900&display=swap');
        @keyframes spin { to { transform:rotate(360deg) } }
        @keyframes pulse { 0%,100%{opacity:1} 50%{opacity:.5} }
        @keyframes slideUp { from{opacity:0;transform:translateY(8px)} to{opacity:1;transform:none} }
        @keyframes slideDown { from{opacity:0;transform:translateY(-6px)} to{opacity:1;transform:none} }
        * { box-sizing:border-box; } button { font-family:inherit; }
      `}</style>

      {/* ── Header ── */}
      <div style={{ position:"sticky", top:0, zIndex:20, background:"#fff", borderBottom:"1.5px solid #EFEFEF" }}>
        <div style={{ maxWidth:600, margin:"0 auto", padding:"0 16px" }}>
          <div style={{ height:4, background:id.color, margin:"0 -16px" }}/>

          {/* Hero band */}
          <div style={{ padding:"10px 0 0", display:"flex", alignItems:"center", gap:12, position:"relative", overflow:"hidden" }}>
            {/* Big background emoji */}
            <div style={{ position:"absolute", right:-10, top:-5, fontSize:80, opacity:.06, userSelect:"none", pointerEvents:"none" }}>
              {id.heroEmoji}
            </div>
            <div style={{ flex:1 }}>
              <div style={{ fontSize:10, fontWeight:700, letterSpacing:3, color:"#AAA" }}>CALENDRIER</div>
              <div style={{ fontSize:22, fontWeight:900, letterSpacing:.5, color:"#111", lineHeight:1 }}>
                MOTORSPORT <span style={{ color:id.color }}>2026</span>
              </div>
            </div>
          </div>

          {/* Series tabs */}
          <div style={{ display:"flex", marginTop:10, overflowX:"auto", scrollbarWidth:"none", borderBottom:"1.5px solid #F0F0F0" }}>
            {series.map(s => {
              const sid = SERIES_ID[s.id]||{};
              const isA = active===s.id;
              return (
                <button key={s.id} onClick={() => setActive(s.id)} style={{ padding:"8px 14px", border:"none", borderBottom:`3px solid ${isA?sid.color:"transparent"}`, background:"transparent", color:isA?sid.color:"#AAAAAA", fontSize:11, fontWeight:isA?800:600, letterSpacing:.5, cursor:"pointer", whiteSpace:"nowrap", transition:"all .15s" }}>
                  {sid.icon} {s.id}
                </button>
              );
            })}
          </div>
        </div>
      </div>

      <div style={{ maxWidth:600, margin:"0 auto", padding:"0 14px" }}>

        {/* ── Next race banner ── */}
        {next&&!loading&&(
          <div style={{ margin:"16px 0 12px", background:`linear-gradient(135deg,${id.color},${id.color}CC)`, borderRadius:14, padding:"14px 18px", display:"flex", justifyContent:"space-between", alignItems:"center", boxShadow:`0 4px 20px ${id.color}30`, animation:"slideUp .3s ease", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", right:10, top:-10, fontSize:70, opacity:.12 }}>{FLAGS[next.country]||id.heroEmoji}</div>
            <div>
              <div style={{ fontSize:9, fontWeight:700, letterSpacing:2.5, color:"rgba(255,255,255,.65)", marginBottom:3 }}>PROCHAINE COURSE</div>
              <div style={{ fontSize:18, fontWeight:900, color:"#fff", lineHeight:1.1, fontFamily:"'Barlow Condensed',sans-serif" }}>{next.name}</div>
              <div style={{ fontSize:11, color:"rgba(255,255,255,.65)", marginTop:3 }}>{fmtRange(next.date_start,next.date_end)}{next.circuit?` · ${next.circuit}`:""}</div>
            </div>
            <div style={{ textAlign:"right" }}>
              {dNext===0?<div style={{ fontSize:12, fontWeight:900, color:"#fff" }}>AUJOURD'HUI</div>
                :<><div style={{ fontSize:42, fontWeight:900, color:"#fff", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{dNext}</div><div style={{ fontSize:9, color:"rgba(255,255,255,.6)", letterSpacing:2, fontWeight:600 }}>JOURS</div></>}
            </div>
          </div>
        )}

        {/* ── Season progress ── */}
        {!loading&&totalCount>0&&(
          <div style={{ marginBottom:12 }}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:4 }}>
              <span style={{ fontSize:10, color:"#AAA", fontWeight:600 }}>SAISON 2026 — {doneCount}/{totalCount} GP</span>
              <span style={{ fontSize:10, color:id.color, fontWeight:700 }}>{Math.round((doneCount/totalCount)*100)}%</span>
            </div>
            <div style={{ height:4, background:"#E8E8E8", borderRadius:2, overflow:"hidden" }}>
              <div style={{ height:"100%", width:`${Math.round((doneCount/totalCount)*100)}%`, background:`linear-gradient(90deg,${id.color},${id.color}99)`, borderRadius:2, transition:"width .5s ease" }}/>
            </div>
          </div>
        )}

        {/* ── Nav tabs ── */}
        <div style={{ display:"flex", gap:5, marginBottom:12, padding:"5px", background:"#E8E8E8", borderRadius:10 }}>
          {[["upcoming","À venir"],["all","Calendrier"],["results","Résultats"],["standings","Classement"]].map(([v,l]) => (
            <button key={v} onClick={() => setFilter(v)} style={{ flex:1, padding:"6px 0", borderRadius:7, border:"none", background:filter===v?"#fff":"transparent", color:filter===v?id.color:"#AAAAAA", fontSize:11, fontWeight:filter===v?800:600, cursor:"pointer", boxShadow:filter===v?"0 1px 4px rgba(0,0,0,0.08)":"none", transition:"all .15s" }}>{l}</button>
          ))}
        </div>

        {loading && <Spinner color={id.color}/>}

        {/* ── Standings ── */}
        {!loading&&filter==="standings"&&<div style={{ animation:"slideUp .25s ease" }}><StandingsPanel seriesId={active} id={id}/></div>}

        {/* ── Race list ── */}
        {!loading&&filter!=="standings"&&(
          <div style={{ display:"flex", flexDirection:"column", gap:6, animation:"slideUp .25s ease" }}>
            {displayed.length===0&&<div style={{ textAlign:"center", color:"#CCC", fontSize:13, padding:40 }}>Aucune course</div>}
            {displayed.map(race => (
              <div key={race.id}>
                <RaceCard race={race} id={id} active={selected?.id===race.id} onClick={r => setSelected(selected?.id===r.id?null:r)}/>
                {selected?.id===race.id && <CircuitPanel race={race} id={id} onClose={() => setSelected(null)}/>}
              </div>
            ))}
          </div>
        )}

        {/* ── Footer ── */}
        {!loading&&<div style={{ marginTop:20, padding:"10px 14px", background:"#fff", borderRadius:10, border:"1.5px solid #EFEFEF", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
          <span style={{ fontSize:10, color:"#CCC", fontWeight:600, letterSpacing:1 }}>{races.length} COURSES · SUPABASE</span>
          <span style={{ fontSize:10, fontWeight:800, color:id.color }}>{id.label.toUpperCase()} 2026</span>
        </div>}
      </div>
    </div>
  );
}
