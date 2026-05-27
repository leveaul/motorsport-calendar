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
  monaco: `<path d="M 100,140 L 60,140 L 40,125 L 38,105 L 45,90 L 55,82 L 75,78 L 90,72 L 95,60 L 88,50 L 100,38 L 118,35 L 140,42 L 155,55 L 160,72 L 155,90 L 145,102 L 130,110 L 115,115 L 100,140 Z" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 88,50 L 78,45 L 72,52 L 80,60 L 90,72" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  silverstone: `<path d="M 30,100 L 32,80 L 42,65 L 58,55 L 78,50 L 100,48 L 122,50 L 142,58 L 158,70 L 164,85 L 162,100 L 155,115 L 140,125 L 120,130 L 100,132 L 80,130 L 62,122 L 46,112 L 34,104 L 30,100 Z" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 100,48 L 102,35 L 115,30 L 128,35 L 130,48" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round"/>`,
  monza: `<path d="M 30,95 L 30,55 Q 30,35 50,32 L 150,32 Q 170,35 170,55 L 170,95 Q 170,115 150,118 L 50,118 Q 30,115 30,95 Z" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 90,32 L 85,50 L 75,55 L 85,60 L 90,78" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round"/><path d="M 125,32 L 120,50 L 112,55 L 122,60 L 125,78" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round"/>`,
  spa: `<path d="M 25,120 L 25,85 L 35,65 L 55,48 L 80,38 L 108,35 L 135,42 L 158,58 L 168,78 L 165,100 L 155,118 L 135,128 L 108,134 L 80,132 L 55,124 L 35,118 L 25,120" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 55,48 L 68,62 L 80,70 L 78,85 L 68,90 L 78,98" stroke="COLOR" stroke-width="4" fill="none" stroke-linecap="round"/>`,
  suzuka: `<path d="M 30,108 L 30,72 L 38,55 L 52,44 L 72,38 L 92,36 L 110,40 L 126,52 L 135,68 L 130,84 L 118,94 L 100,100 L 84,94 L 72,82 L 72,68 L 80,56 L 94,48" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 135,68 L 148,80 L 155,96 L 150,112 L 136,122 L 115,128 L 90,130 L 66,124 L 48,114 L 35,108 L 30,108" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round"/>`,
  lemans: `<path d="M 22,130 L 22,95 L 28,72 L 42,55 L 65,44 L 95,38 L 125,38 L 155,44 L 172,58 L 175,78 L 168,96 L 148,108 L 148,90 L 108,90 L 108,108 L 85,115 L 65,120 L 42,128 L 22,130" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  paulricard: `<path d="M 28,112 L 28,78 L 35,60 L 52,46 L 78,38 L 108,35 L 138,40 L 160,55 L 170,75 L 168,98 L 158,118 L 138,130 L 108,135 L 78,132 L 50,122 L 32,115 L 28,112" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  catalunya: `<path d="M 32,108 L 32,80 L 40,62 L 58,50 L 82,42 L 108,40 L 135,46 L 155,60 L 165,80 L 162,100 L 152,118 L 132,130 L 105,135 L 78,132 L 52,122 L 36,112 L 32,108" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  jerez: `<path d="M 38,112 L 38,80 L 46,62 L 62,50 L 85,44 L 108,42 L 132,48 L 152,62 L 162,80 L 160,100 L 150,118 L 130,130 L 105,135 L 78,132 L 55,122 L 42,115 L 38,112" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  mugello: `<path d="M 30,112 L 30,78 L 38,58 L 55,44 L 80,36 L 108,34 L 135,40 L 158,55 L 168,75 L 166,98 L 155,118 L 132,132 L 102,138 L 72,134 L 48,122 L 34,115 L 30,112" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 108,34 L 110,50 L 125,54 L 110,58" stroke="COLOR" stroke-width="3.5" fill="none" stroke-linecap="round"/>`,
  buriram: `<path d="M 32,108 L 32,72 L 40,54 L 58,44 L 85,38 L 112,36 L 138,42 L 158,56 L 168,76 L 165,98 L 154,118 L 132,132 L 102,138 L 72,134 L 48,122 L 36,112 L 32,108" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  albertpark: `<path d="M 35,105 L 35,75 L 42,58 L 58,46 L 80,40 L 105,38 L 130,44 L 152,58 L 162,78 L 160,100 L 150,118 L 128,130 L 100,135 L 72,130 L 50,120 L 38,110 L 35,105" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  redbullring: `<path d="M 58,132 L 30,108 L 28,85 L 38,65 L 55,50 L 80,40 L 108,38 L 135,45 L 155,62 L 162,85 L 158,108 L 142,125 L 115,133 L 88,135 L 65,133 L 58,132" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  imola: `<path d="M 35,112 L 35,80 L 42,62 L 58,48 L 82,40 L 108,38 L 135,44 L 155,60 L 164,80 L 160,102 L 148,120 L 126,132 L 98,136 L 70,132 L 48,120 L 38,114 L 35,112" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 82,40 L 80,56 L 92,60 L 80,68" stroke="COLOR" stroke-width="3.5" fill="none" stroke-linecap="round"/>`,
  yasmarina: `<path d="M 28,105 L 30,75 L 40,55 L 58,42 L 85,36 L 115,36 L 142,44 L 162,60 L 170,80 L 166,102 L 152,120 L 128,132 L 98,136 L 68,130 L 45,118 L 32,110 L 28,105" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 142,44 L 155,35 L 165,42 L 162,60" stroke="COLOR" stroke-width="3.5" fill="none" stroke-linecap="round"/>`,
  cota: `<path d="M 35,115 L 32,88 L 38,68 L 55,52 L 78,42 L 105,40 L 130,46 L 152,62 L 162,82 L 158,105 L 144,122 L 120,132 L 92,135 L 65,128 L 45,118 L 35,115" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 105,40 L 108,25 L 120,22 L 125,35" stroke="COLOR" stroke-width="3.5" fill="none" stroke-linecap="round"/>`,
  baku: `<path d="M 25,115 L 25,85 L 32,62 L 48,46 L 72,36 L 102,32 L 135,36 L 162,52 L 172,75 L 168,100 L 152,120 L 125,132 L 95,136 L 65,130 L 40,118 L 25,115" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  hungaroring: `<path d="M 32,108 L 32,75 L 40,56 L 58,44 L 82,38 L 108,36 L 135,42 L 155,58 L 166,78 L 163,100 L 152,120 L 128,132 L 100,136 L 72,132 L 48,120 L 36,112 L 32,108" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  zandvoort: `<path d="M 45,118 L 30,100 L 30,72 L 40,54 L 58,42 L 85,36 L 115,38 L 140,48 L 158,65 L 165,88 L 160,110 L 145,126 L 118,135 L 88,135 L 62,128 L 48,120 L 45,118" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  marinabay: `<path d="M 28,115 L 28,82 L 38,62 L 55,48 L 80,40 L 105,38 L 132,44 L 155,60 L 165,82 L 162,105 L 148,122 L 122,132 L 95,135 L 65,128 L 42,118 L 28,115" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  losail: `<path d="M 30,110 L 30,75 L 38,56 L 55,42 L 80,36 L 108,34 L 135,40 L 155,55 L 165,75 L 163,98 L 152,118 L 128,130 L 100,135 L 72,130 L 48,120 L 35,113 L 30,110" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  gillesvilleneuve: `<path d="M 55,130 L 30,108 L 30,78 L 40,58 L 58,44 L 85,36 L 125,36 L 152,48 L 165,68 L 162,95 L 148,118 L 120,132 L 55,130" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/><path d="M 85,36 L 88,55 L 100,58 L 88,65" stroke="COLOR" stroke-width="3.5" fill="none" stroke-linecap="round"/>`,
  interlagos: `<path d="M 42,120 L 28,102 L 28,72 L 38,52 L 58,40 L 88,35 L 118,38 L 145,52 L 162,72 L 162,95 L 148,115 L 122,130 L 90,135 L 62,128 L 42,120" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
  default: `<path d="M 30,110 L 30,80 L 40,62 L 58,50 L 82,42 L 108,40 L 135,46 L 155,62 L 164,82 L 160,105 L 148,122 L 122,132 L 95,136 L 65,128 L 45,118 L 30,110" stroke="COLOR" stroke-width="4.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>`,
};

function getTrackKey(circuit) {
  if (!circuit) return "default";
  const c = circuit.toLowerCase();
  if (c.includes("monaco")) return "monaco";
  if (c.includes("silverstone")) return "silverstone";
  if (c.includes("monza")) return "monza";
  if (c.includes("spa")) return "spa";
  if (c.includes("suzuka")) return "suzuka";
  if (c.includes("sarthe") || (c.includes("mans") && !c.includes("bugatti"))) return "lemans";
  if (c.includes("bugatti") || c.includes("castellet") || c.includes("paul ricard")) return "paulricard";
  if (c.includes("catalunya") || c.includes("barcelona")) return "catalunya";
  if (c.includes("jerez")) return "jerez";
  if (c.includes("mugello")) return "mugello";
  if (c.includes("buriram") || c.includes("chang")) return "buriram";
  if (c.includes("albert park")) return "albertpark";
  if (c.includes("red bull ring") || c.includes("spielberg")) return "redbullring";
  if (c.includes("imola")) return "imola";
  if (c.includes("yas marina")) return "yasmarina";
  if (c.includes("americas") || c.includes("cota")) return "cota";
  if (c.includes("baku") || c.includes("azerbaïdjan") || c.includes("azerbaijan")) return "baku";
  if (c.includes("hungaroring") || c.includes("budapest")) return "hungaroring";
  if (c.includes("zandvoort")) return "zandvoort";
  if (c.includes("marina bay") || c.includes("singapore")) return "marinabay";
  if (c.includes("lusail") || c.includes("losail") || c.includes("qatar")) return "losail";
  if (c.includes("gilles villeneuve") || c.includes("montreal") || c.includes("montréal")) return "gillesvilleneuve";
  if (c.includes("interlagos") || c.includes("são paulo") || c.includes("sao paulo")) return "interlagos";
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
