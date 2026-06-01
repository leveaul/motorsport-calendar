import { useState, useEffect } from "react";

const SUPABASE_URL = "https://qgdcutklhgnlcrxuvgkn.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnZGN1dGtsaGdubGNyeHV2Z2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4NzQ0NjAsImV4cCI6MjA5NTQ1MDQ2MH0.ltV5jlQfoF4OS6078lwwRAV-q-IDN7biLzHzM1tkUI8";
const H = { "apikey": SUPABASE_KEY, "Authorization": `Bearer ${SUPABASE_KEY}` };
async function sb(path) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, { headers: H });
  if (!r.ok) throw new Error(await r.text());
  return r.json();
}

const SERIES_ID = {
  F1:    { label:"Formula 1",    color:"#E8002D", bg:"#FFF0F2", text:"#B0001F", icon:"🏎️", heroEmoji:"🏎️" },
  MotoGP:{ label:"MotoGP",       color:"#D50032", bg:"#FFF0F1", text:"#A50027", icon:"🏍️", heroEmoji:"🏍️" },
  WEC:   { label:"FIA WEC",      color:"#0066CC", bg:"#EFF6FF", text:"#004A9E", icon:"⏱️", heroEmoji:"⏱️" },
  ELMS:  { label:"ELMS",         color:"#00833E", bg:"#EDFAF3", text:"#006030", icon:"🏁", heroEmoji:"🏁" },
  IMSA:  { label:"IMSA",         color:"#0033A0", bg:"#EEF2FF", text:"#002280", icon:"🏆", heroEmoji:"🏆" },
  WRC:   { label:"WRC",            color:"#1A3C6E", bg:"#EEF2FF", text:"#0A1F40", icon:"🚗", heroEmoji:"🚗" },
  GTWCE: { label:"GT WC Europe", color:"#FF6600", bg:"#FFF4EE", text:"#CC4400", icon:"🏆", heroEmoji:"🏆" },
};

const COUNTRY_CODES = {
  "Australie":"au","Chine":"cn","Japon":"jp","Etats-Unis":"us","États-Unis":"us","Canada":"ca",
  "Monaco":"mc","Espagne":"es","Autriche":"at","Angleterre":"gb","Grande-Bretagne":"gb",
  "Belgique":"be","Hongrie":"hu","Pays-Bas":"nl","Italie":"it","Azerbaïdjan":"az",
  "Singapour":"sg","Mexique":"mx","Brésil":"br","Qatar":"qa","Abu Dhabi":"ae",
  "Bahreïn":"bh","Thaïlande":"th","Indonésie":"id","Malaisie":"my","France":"fr",
  "Portugal":"pt","Allemagne":"de","Arabie Saoudite":"sa","Grande Bretagne":"gb",
};

function Flag({ country, size=20 }) {
  const code = COUNTRY_CODES[country];
  if (!code) return null;
  return <img src={`https://flagcdn.com/w${size*2}/${code}.png`} alt={country}
    style={{ width:size*1.4, height:size, objectFit:"cover", borderRadius:2, display:"block" }}
    onError={e => e.target.style.display="none"} />;
}

const TRACK_IMAGES = {
  // ── F1 (/public/tracks/f1/) ──────────────────────────────────────────────
  f1_monaco:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/monaco.webp",
  f1_silverstone:  "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/silverstone.webp",
  f1_monza:        "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/monza.webp",
  f1_spa:          "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/spa.webp",
  f1_suzuka:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/suzuka.webp",
  f1_albertpark:   "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/albertpark.webp",
  f1_redbullring:  "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/redbullring.webp",
  f1_barcelona:    "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/barcelona.webp",
  f1_zandvoort:    "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/zandvoort.webp",
  f1_hungaroring:  "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/hungaroring.webp",
  f1_imola:        "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/imola.webp",
  f1_yasmarina:    "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/yasmarina.webp",
  f1_cota:         "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/cota.webp",
  f1_baku:         "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/baku.webp",
  f1_losail:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/losail.webp",
  f1_marinabay:    "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/marinabay.webp",
  f1_montreal:     "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/montreal.webp",
  f1_interlagos:   "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/interlagos.webp",
  f1_jeddah:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/jeddah.webp",
  f1_miami:        "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/miami.webp",
  f1_lasvegas:     "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/lasvegas.webp",
  f1_shanghai:     "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/shanghai.webp",
  f1_bahrain:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/bahrain.webp",
  f1_mexicocity:   "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/mexicocity.webp",
  f1_madrid:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/f1/madrid.webp",  // à ajouter quand formula1.com le publie

  // ── MotoGP (/public/tracks/motogp/) ─────────────────────────────────────
  motogp_tha:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/tha.svg",
  motogp_bra:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/bra.svg",
  motogp_usa:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/usa.svg",
  motogp_spa:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/spa.svg",
  motogp_fra:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/fra.svg",
  motogp_cat:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/cat.svg",
  motogp_ita:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/ita.svg",
  motogp_hun:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/hun.svg",
  motogp_cze:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/cze.svg",
  motogp_nld:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/nld.svg",
  motogp_ger:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/ger.svg",
  motogp_gbr:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/gbr.svg",
  motogp_ara:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/ara.svg",
  motogp_rsm:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/rsm.svg",
  motogp_aut:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/aut.svg",
  motogp_jpn:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/jpn.svg",
  motogp_ina:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/ina.svg",
  motogp_aus:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/aus.svg",
  motogp_mal:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/mal.svg",
  motogp_qat:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/qat.svg",
  motogp_por:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/por.svg",
  motogp_val:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/motogp/val.svg",

  // ── WEC (/public/tracks/wec/) ────────────────────────────────────────────
  wec_losail:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/losail.png",
  wec_imola:       "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/imola.png",
  wec_spa:         "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/spa.png",
  wec_lemans:      "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/lemans.png",
  wec_saopaulo:    "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/saopaulo.png",
  wec_cota:        "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/cota.png",
  wec_fuji:        "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/fuji.png",
  wec_bahrain:     "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public/tracks/wec/bahrain.png",

  // ── ELMS / GTWCE / IMSA — à compléter ───────────────────────────────────

};


function getTrackKey(circuit, seriesId, circuitKey) {
  // Priorité 1 : circuit_key direct depuis Supabase (préfixé par série)
  if (circuitKey) return circuitKey;

  if (!circuit) return null;
  const c = circuit.toLowerCase();

  // Priorité 2 : MotoGP
  if (seriesId === "MotoGP") {
    if (c.includes("buriram") || c.includes("chang"))              return "motogp_tha";
    if (c.includes("goiania") || c.includes("senna"))              return "motogp_bra";
    if (c.includes("americas") || c.includes("cota") || c.includes("austin")) return "motogp_usa";
    if (c.includes("jerez") || c.includes("angel nieto"))          return "motogp_spa";
    if (c.includes("bugatti") || c.includes("le mans"))            return "motogp_fra";
    if (c.includes("catalunya") || c.includes("barcelona"))        return "motogp_cat";
    if (c.includes("mugello"))                                      return "motogp_ita";
    if (c.includes("balaton"))                                      return "motogp_hun";
    if (c.includes("brno") || c.includes("automotodrom"))          return "motogp_cze";
    if (c.includes("assen"))                                        return "motogp_nld";
    if (c.includes("sachsenring"))                                  return "motogp_ger";
    if (c.includes("silverstone"))                                  return "motogp_gbr";
    if (c.includes("aragon") || c.includes("motorland"))           return "motogp_ara";
    if (c.includes("misano") || c.includes("simoncelli"))          return "motogp_rsm";
    if (c.includes("red bull ring") || c.includes("spielberg"))    return "motogp_aut";
    if (c.includes("motegi"))                                       return "motogp_jpn";
    if (c.includes("mandalika") || c.includes("pertamina"))        return "motogp_ina";
    if (c.includes("phillip island"))                               return "motogp_aus";
    if (c.includes("sepang") || c.includes("petronas"))            return "motogp_mal";
    if (c.includes("lusail") || c.includes("losail"))              return "motogp_qat";
    if (c.includes("algarve") || c.includes("portimao"))           return "motogp_por";
    if (c.includes("valencia") || c.includes("tormo"))             return "motogp_val";
    return null;
  }

  // Priorité 3 : WEC / ELMS / GTWCE / IMSA
  if (seriesId === "WEC" || seriesId === "ELMS" || seriesId === "GTWCE" || seriesId === "IMSA") {
    if (c.includes("lusail") || c.includes("losail"))              return "wec_losail";
    if (c.includes("imola") || c.includes("dino ferrari"))           return "wec_imola";
    if (c.includes("spa"))                                          return "wec_spa";
    if (c.includes("sarthe") || (c.includes("mans") && !c.includes("bugatti"))) return "wec_lemans";
    if (c.includes("interlagos") || c.includes("são paulo") || c.includes("sao paulo") || c.includes("goiania") || c.includes("goiânia") || c.includes("senna") || c.includes("ayrton") || c.includes("pace") || c.includes("paulo") || c.includes("josé carlos") || c.includes("jose carlos")) return "wec_saopaulo";
    if (c.includes("americas") || c.includes("cota") || c.includes("austin")) return "wec_cota";
    if (c.includes("fuji"))                                         return "wec_fuji";
    if (c.includes("bahrain") || c.includes("sakhir"))             return "wec_bahrain";
    if (c.includes("portimao") || c.includes("algarve"))           return "wec_portimao";
    return null;
  }

  // Priorité 4 : F1 (fallback)
  if (c.includes("monaco"))                                         return "f1_monaco";
  if (c.includes("monza"))                                          return "f1_monza";
  if (c.includes("silverstone"))                                    return "f1_silverstone";
  if (c.includes("spa"))                                            return "f1_spa";
  if (c.includes("suzuka"))                                         return "f1_suzuka";
  if (c.includes("albert park"))                                    return "f1_albertpark";
  if (c.includes("red bull ring") || c.includes("spielberg"))      return "f1_redbullring";
  if (c.includes("catalunya") || c.includes("barcelona"))          return "f1_barcelona";
  if (c.includes("zandvoort"))                                      return "f1_zandvoort";
  if (c.includes("hungaroring") || c.includes("budapest"))         return "f1_hungaroring";
  if (c.includes("imola"))                                          return "f1_imola";
  if (c.includes("yas marina"))                                     return "f1_yasmarina";
  if (c.includes("americas") || c.includes("cota") || c.includes("austin")) return "f1_cota";
  if (c.includes("baku") || c.includes("azerbaijan"))              return "f1_baku";
  if (c.includes("lusail") || c.includes("losail"))                return "f1_losail";
  if (c.includes("marina bay") || c.includes("singapore"))         return "f1_marinabay";
  if (c.includes("gilles villeneuve") || c.includes("montreal"))   return "f1_montreal";
  if (c.includes("interlagos") || c.includes("são paulo") || c.includes("sao paulo")) return "f1_interlagos";
  if (c.includes("jeddah") || c.includes("corniche"))              return "f1_jeddah";
  if (c.includes("miami"))                                          return "f1_miami";
  if (c.includes("las vegas"))                                      return "f1_lasvegas";
  if (c.includes("shanghai"))                                       return "f1_shanghai";
  if (c.includes("bahrain") || c.includes("sakhir"))               return "f1_bahrain";
  if (c.includes("hermanos") || c.includes("mexico"))              return "f1_mexicocity";
  if (c.includes("gilles") || c.includes("montreal") || c.includes("montréal") || c.includes("canada")) return "f1_montreal";
  if (c.includes("madrid") || c.includes("ifema") || c.includes("madring"))     return "f1_madrid";
  return null;
}


function TrackSVG({ circuit, color, size=140, seriesId='', circuitKey=null }) {
  const key = getTrackKey(circuit, seriesId, circuitKey);
  const imgUrl = key ? TRACK_IMAGES[key] : null;
  const [error, setError] = useState(false);
  useEffect(() => { setError(false); }, [circuit]);

  if (!imgUrl || error) return (
    <div style={{ width:"100%", height:"100%", display:"flex", alignItems:"center", justifyContent:"center" }}>
      <div style={{ fontSize:12, color:"#CCC", textAlign:"center" }}>{circuit || "Circuit"}</div>
    </div>
  );
  return (
    <div style={{ width:"100%", height:"100%", display:"flex", alignItems:"center", justifyContent:"center" }}>
      <img src={imgUrl} alt={circuit} onError={() => setError(true)}
        style={{ width:"100%", height:"100%", objectFit:"contain", display:"block" }} />
    </div>
  );
}


const MONTHS_FR = ["Jan","Fev","Mar","Avr","Mai","Jun","Jul","Aou","Sep","Oct","Nov","Dec"];
function fmtDate(d) { if (!d) return ""; const x = new Date(d+"T12:00:00"); return `${x.getDate()} ${MONTHS_FR[x.getMonth()]}`; }
function fmtRange(s, e) {
  if (!s) return "";
  if (!e || s===e) return fmtDate(s);
  const a=new Date(s+"T12:00:00"), b=new Date(e+"T12:00:00");
  if (a.getMonth()===b.getMonth()) return `${a.getDate()}-${b.getDate()} ${MONTHS_FR[a.getMonth()]}`;
  return `${fmtDate(s)} -> ${fmtDate(e)}`;
}
function daysUntil(d) {
  if (!d) return null;
  const t=new Date(); t.setHours(0,0,0,0);
  const x=new Date(d+"T00:00:00"); x.setHours(0,0,0,0);
  return Math.ceil((x-t)/86400000);
}

function Spinner({ color }) {
  return <div style={{ display:"flex", justifyContent:"center", padding:"40px 0" }}>
    <div style={{ width:35, height:35, borderRadius:"50%", border:`3px solid ${color}30`, borderTop:`3px solid ${color}`, animation:"spin .7s linear infinite" }}/>
  </div>;
}

function CircuitPanel({ race, id, sprintRace, onClose }) {
  const [results, setResults] = useState([]);
  const [sprintResults, setSprintResults] = useState([]);
  const [loadingR, setLoadingR] = useState(true);
  const key = getTrackKey(race.circuit, race.series_id, race.circuit_key);
  const [info, setInfo] = useState({ lap_length:"--", turns:"--", laps:null, lap_record:"--", first_year:"--" });
  useEffect(() => {
    if (!key) return;
    sb(`circuits?key=eq.${key}&limit=1`).then(rows => {
      if (rows[0]) setInfo(rows[0]);
    }).catch(() => {});
  }, [key]);
  const MEDALS = ["🥇","🥈","🥉"];

  useEffect(() => {
    // Reset immédiat à chaque changement de course → pas de "mémoire" visuelle
    setResults([]);
    setSprintResults([]);
    setLoadingR(race.status === "done");
    if (race.status==="done") {
      sb(`results?race_id=eq.${race.id}&order=position.asc`).then(r => { setResults(r); setLoadingR(false); }).catch(()=>setLoadingR(false));
    }
    if (sprintRace?.id) {
      sb(`results?race_id=eq.${sprintRace.id}&order=position.asc&limit=10`).then(setSprintResults).catch(()=>{});
    }
  }, [race.id, sprintRace?.id]);

  return (
    <div style={{ background:"#FAFAFA", border:`1.5px solid ${id.color}30`, borderTop:"none", borderRadius:"0 0 12px 12px", overflow:"hidden", animation:"expandDown .25s cubic-bezier(.4,0,.2,1)" }}>
      <div style={{ background:`linear-gradient(135deg,${id.color},${id.color}BB)`, padding:"15px 20px", display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
        <div style={{ display:"flex", alignItems:"center", gap:12 }}>
          <Flag country={race.country} size={24}/>
          <div>
            <div className="panel-title" style={{ fontSize:20, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
            <div className="panel-sub" style={{ fontSize:12, color:"rgba(255,255,255,.7)", marginTop:1 }}>{race.circuit}</div>
          </div>
        </div>
        <button onClick={onClose} style={{ background:"rgba(255,255,255,.2)", border:"none", color:"#fff", width:32, height:32, borderRadius:8, cursor:"pointer", fontSize:16 }}>X</button>
      </div>
      <div className="circuit-panel-inner" style={{ padding:"18px 24px", display:"grid", gridTemplateColumns: (!loadingR && results.length > 0) ? "2fr 1fr 1.5fr" : "2fr 1fr", gap:16 }}>
        <div style={{ background:"#fff", borderRadius:12, border:`1px solid ${id.color}15`, padding:12, display:"flex", flexDirection:"column", alignItems:"center", overflow:"hidden" }}>
          <div style={{ fontSize:11, color:"#BBB", letterSpacing:1.5, marginBottom:6, fontWeight:700 }}>TRACE</div>
          <div className="track-img-wrap" style={{ width:"100%", height:420, display:"flex", alignItems:"center", justifyContent:"center", overflow:"hidden" }}>
            <TrackSVG circuit={race.circuit} color={id.color} size={160} seriesId={race.series_id} circuitKey={race.circuit_key}/>
          </div>
        </div>
        <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
          {[["📏","Longueur",info.lap_length],["↩️","Virages",info.turns !== "--" ? `${info.turns}` : "--"],...(info.laps ? [["🔄","Tours",`${info.laps} tours`]] : []),["⏱️","Record",info.lap_record],["📅","Date",fmtRange(race.date_start,race.date_end)],["🗓️","Au calendrier",info.first_year]].map(([emoji,label,val]) => (
            <div key={label} style={{ background:"#fff", borderRadius:10, border:"1px solid #F0F0F0", padding:"8px 11px", display:"flex", alignItems:"flex-start", gap:9 }}>
              <span style={{ fontSize:16, flexShrink:0, marginTop:1 }}>{emoji}</span>
              <div style={{ flex:1, minWidth:0 }}>
                <div className="info-label" style={{ fontSize:10, color:"#CCC", letterSpacing:1, fontWeight:700 }}>{label.toUpperCase()}</div>
                <div className="info-value" style={{ fontSize:14, fontWeight:700, color:"#222", fontFamily:"'Barlow Condensed',sans-serif", lineHeight:1.3 }}>{val}</div>
              </div>
            </div>
          ))}
        </div>
      </div>
      {race.status==="done" ? (
        <div style={{ padding:"0 16px 12px" }}>
          <div style={{ fontSize:11, fontWeight:700, color:"#BBB", letterSpacing:1.5, marginBottom:7 }}>RESULTATS</div>
          {loadingR && <Spinner color={id.color}/>}
          {!loadingR && results.length===0 && <div style={{ textAlign:"center", color:"#DDD", fontSize:15, padding:"8px 0" }}>Pas encore de resultats</div>}
          {!loadingR && results.length>0 && (
            <div style={{ display:"flex", flexDirection:"column", gap:5 }}>
              {results.map((r,i) => (
                <div key={i} style={{ display:"flex", alignItems:"center", gap:11, padding:"9px 11px", background:i===0?id.bg:"#fff", border:`1px solid ${i===0?id.color+"30":"#F0F0F0"}`, borderRadius:10 }}>
                  <div style={{ width:31, height:31, borderRadius:8, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?12:10, fontWeight:800, color:i<3?"#fff":"#AAA", flexShrink:0 }}>
                    {i<3?["🥇","🥈","🥉"][i]:r.position}
                  </div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div className="result-driver" style={{ fontSize:16, fontWeight:700, color:i===0?id.text:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.driver}</div>
                    {r.team&&<div style={{ fontSize:11, color:"#BBB" }}>{r.team}</div>}
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    {r.points>0&&<div style={{ fontSize:15, fontWeight:800, color:id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>{r.points} pts</div>}
                    {r.gap&&<div style={{ fontSize:11, color:"#CCC" }}>{r.gap}</div>}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

      ) : (
        <div style={{ padding:"0 16px 12px" }}>
          <div style={{ background:id.bg, borderRadius:12, padding:"12px 18px", border:`1px dashed ${id.color}40`, display:"flex", alignItems:"center", justifyContent:"center", gap:12 }}>
            <Flag country={race.country} size={20}/>
            <div style={{ fontSize:16, color:id.text, fontWeight:700 }}>
              {daysUntil(race.date_start)===0 ? "C'est aujourd'hui !" : `Dans ${daysUntil(race.date_start)} jours`}
            </div>
          </div>
        </div>
      )}
        {/* ── Résultats Sprint ── */}
        {sprintResults.length > 0 && (
          <div style={{ padding:"0 16px 4px" }}>
            <div style={{ fontSize:11, fontWeight:700, letterSpacing:1.5, color:"#FF6B00", marginBottom:8 }}>RÉSULTATS SPRINT</div>
            {sprintResults.slice(0,5).map((r,i) => (
              <div key={i} style={{ display:"flex", alignItems:"center", gap:10, padding:"7px 10px", background:i===0?"#FFF5EE":"#fff", border:`1px solid ${i===0?"#FF6B0030":"#F0F0F0"}`, borderRadius:10, marginBottom:6 }}>
                <div style={{ width:28, height:28, borderRadius:7, background:i===0?"#FF6B00":i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?11:9, fontWeight:800, color:i<3?"#fff":"#AAA", flexShrink:0 }}>
                  {i<3?["🥇","🥈","🥉"][i]:r.position}
                </div>
                <div style={{ flex:1, minWidth:0 }}>
                  <div style={{ fontSize:14, fontWeight:700, color:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.driver}</div>
                  {r.team&&<div style={{ fontSize:10, color:"#BBB" }}>{r.team}</div>}
                </div>
                <div style={{ textAlign:"right", flexShrink:0 }}>
                  {r.points>0&&<div style={{ fontSize:13, fontWeight:800, color:"#FF6B00", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.points} pts</div>}
                  {r.gap&&<div style={{ fontSize:10, color:"#CCC" }}>{r.gap}</div>}
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
    sb(`standings?series_id=eq.${seriesId}&type=eq.${tab}&season=eq.2026&order=position.asc`).then(r=>{setData(r);setLoading(false);}).catch(()=>setLoading(false));
  }, [seriesId, tab]);
  const maxPts = data[0]?.points||1;
  return (
    <div>
      <div style={{ display:"flex", gap:8, marginBottom:12 }}>
        {[["driver","Pilotes"],["team","Equipes"]].map(([v,l])=>(
          <button key={v} onClick={()=>setTab(v)} style={{ padding:"8px 20px", borderRadius:25, border:`1.5px solid ${tab===v?id.color:"#E8E8E8"}`, background:tab===v?id.color:"#fff", color:tab===v?"#fff":"#888", fontSize:15, fontWeight:700, cursor:"pointer", fontFamily:"inherit" }}>{l}</button>
        ))}
      </div>
      {loading&&<Spinner color={id.color}/>}
      {!loading&&data.length===0&&<div style={{ textAlign:"center", color:"#DDD", fontSize:16, padding:"30px 0" }}>Classement pas encore disponible</div>}
      {!loading&&data.length>0&&(
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {data.map((s,i)=>(
            <div key={i} style={{ background:"#fff", border:`1.5px solid ${i===0?id.color+"60":"#EFEFEF"}`, borderLeft:`4px solid ${i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E8E8E8"}`, borderRadius:12, padding:"11px 15px", display:"flex", alignItems:"center", gap:12 }}>
              <div style={{ fontSize:21, fontWeight:900, color:i===0?id.color:i<3?"#888":"#DDD", minWidth:32, textAlign:"center", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.position}</div>
              <div style={{ flex:1, minWidth:0 }}>
                <div className="standings-name" style={{ fontSize:16, fontWeight:700, color:i===0?"#111":"#333", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.name}</div>
                {s.nationality&&<div style={{ fontSize:12, color:"#AAA" }}>{s.nationality}</div>}
                <div style={{ marginTop:4, height:3, background:"#F0F0F0", borderRadius:2, overflow:"hidden" }}>
                  <div style={{ height:"100%", width:`${Math.round((s.points/maxPts)*100)}%`, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E0E0E0", borderRadius:2 }}/>
                </div>
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                <div className="standings-pts" style={{ fontSize:25, fontWeight:900, lineHeight:1, color:i===0?id.color:"#CCC", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.points}</div>
                <div style={{ fontSize:10, color:"#CCC", letterSpacing:1, fontWeight:600 }}>PTS</div>
                {s.wins>0&&<div style={{ fontSize:12, color:id.color, fontWeight:700 }}>{s.wins}V</div>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function RaceCard({ race, id, active, onClick }) {
  const today = new Date().toISOString().slice(0,10);
  const done = race.status==="done";
  const live = race.status==="live";
  const days = daysUntil(race.date_start);
  return (
    <div onClick={()=>onClick(race)} style={{ display:"flex", alignItems:"center", background:active?`${id.color}08`:"#FFFFFF", border:`1.5px solid ${active?id.color:live?id.color:"#E8E8E8"}`, borderLeft:`4px solid ${live?id.color:done?"#D0D0D0":id.color}`, borderRadius:active?"15px 15px 0 0":12, cursor:"pointer", transition:"all .15s", overflow:"hidden", opacity:done&&!race._hasResults?0.5:1 }}>
      <div style={{ minWidth:72, padding:"12px 5px", background:live?id.color:done?"#F5F5F5":id.bg, display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", flexShrink:0, gap:4 }}>
        <Flag country={race.country} size={18}/>
        <div className="race-day" style={{ fontSize:21, fontWeight:900, lineHeight:1, color:live?"#fff":done?"#AAA":id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>{new Date(race.date_start+"T12:00:00").getDate()}</div>
        <div className="race-month" style={{ fontSize:10, fontWeight:600, letterSpacing:1, textTransform:"uppercase", color:live?"#ffffff99":done?"#BBB":id.text }}>{MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}</div>
      </div>
      <div style={{ flex:1, padding:"11px 14px", minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:2, flexWrap:"wrap" }}>
          {live&&<span style={{ fontSize:10, fontWeight:700, letterSpacing:1.5, color:"#fff", background:id.color, padding:"2px 8px", borderRadius:5, animation:"pulse 1.4s infinite" }}>LIVE</span>}
          {sprintRounds.has(race.round)&&<span style={{ fontSize:10, fontWeight:700, color:"#FF6B00", background:"#FFF0E0", padding:"3px 10px", borderRadius:5 }}>Sprint WE</span>}
          {race.type==="sprint_weekend"&&race.series_id==="MotoGP"&&<span style={{ fontSize:10, fontWeight:600, color:"#888", background:"#F2F2F2", padding:"2px 8px", borderRadius:5 }}>+ SPRINT SAM.</span>}
          {race.type==="sprint_weekend"&&race.series_id==="F1"&&<span style={{ fontSize:10, fontWeight:700, color:id.color, background:id.bg, padding:"2px 8px", borderRadius:5 }}>SPRINT WE</span>}
          {done&&race._hasResults&&<span style={{ fontSize:10, fontWeight:600, color:id.text, background:id.bg, padding:"2px 8px", borderRadius:5 }}>RESULTATS</span>}
          {race.type!=="sprint"&&race.type!=="sprint_weekend"&&race.round&&<span style={{ fontSize:11, color:"#CCC", fontWeight:600 }}>R{race.round}</span>}
        </div>
        <div className="race-name" style={{ fontSize:18, fontWeight:700, color:done?"#999":"#111", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
        <div className="race-circuit" style={{ fontSize:12, color:"#BBB", marginTop:1, whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis" }}>{race.circuit}</div>
      </div>
      {!done&&days!==null&&(
        <div style={{ padding:"0 10px", textAlign:"center", flexShrink:0 }}>
          {days===0?<div style={{ fontSize:12, fontWeight:800, color:id.color }}>AUJ.</div>
            :days>0?<><div className="days-left" style={{ fontSize:days<=99?20:14, fontWeight:900, color:days<=7?id.color:"#DDD", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{days}</div><div style={{ fontSize:10, color:"#DDD", letterSpacing:1, fontWeight:600 }}>J</div></>:null}
        </div>
      )}
      <div style={{ padding:"0 8px", color:active?id.color:"#DDD", fontSize:15, flexShrink:0 }}>{active?"▲":"▼"}</div>
    </div>
  );
}

function HomeDashboard({ series, onSelect, id }) {
  const today = new Date().toISOString().slice(0,10);
  const [data, setData] = useState({});   // { seriesId: { next, top3 } }

  useEffect(() => {
    series.forEach(s => {
      // Prochain event
      Promise.all([
        sb(`races?series_id=eq.${s.id}&date_start=gte.${today}&type=neq.sprint&order=date_start.asc&limit=1`),
        sb(`standings?series_id=eq.${s.id}&type=eq.driver&season=eq.2026&order=position.asc&limit=3`)
      ]).then(([races, standing]) => {
        setData(prev => ({ ...prev, [s.id]: { next: races[0] || null, top3: standing } }));
      }).catch(() => {});
    });
  }, [series]);

  return (
    <div style={{ animation:"slideUp .3s ease" }}>
      <div style={{ display:"grid", gridTemplateColumns:"repeat(auto-fill,minmax(320px,1fr))", gap:20 }}>
        {[...series].sort((a, b) => {
          const da = data[a.id]?.next?.date_start || '9999';
          const db = data[b.id]?.next?.date_start || '9999';
          return da.localeCompare(db);
        }).map(s => {
          const sid = SERIES_ID[s.id] || {};
          const d = data[s.id];
          const next = d?.next;
          const top3 = d?.top3 || [];
          const key = next ? getTrackKey(next.circuit, s.id, next.circuit_key) : null;
          const imgUrl = key ? TRACK_IMAGES[key] : null;
          const days = next ? daysUntil(next.date_start) : null;

          return (
            <div key={s.id}
              onClick={() => onSelect(s.id)}
              style={{ background:"#fff", border:`0.5px solid #E8E8E8`, borderRadius:20, overflow:"hidden", cursor:"pointer", transition:"border-color .15s", borderTop:`3px solid ${sid.color}` }}
              onMouseEnter={e => e.currentTarget.style.borderColor = sid.color}
              onMouseLeave={e => e.currentTarget.style.borderColor = '#E8E8E8'}
            >
              {/* Header série */}
              <div style={{ padding:"18px 20px 12px", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
                <div style={{ display:"flex", alignItems:"center", gap:10 }}>
                  <span style={{ fontSize:25 }}>{sid.icon}</span>
                  <div>
                    <div style={{ fontSize:30, fontWeight:900, color:"#111" }}>{sid.label}</div>
                    <div style={{ fontSize:12, fontWeight:700, letterSpacing:1, color:"#BBB" }}>2026</div>
                  </div>
                </div>
                {days !== null && (
                  <div style={{ textAlign:"right" }}>
                    <div style={{ fontSize:48, fontWeight:900, color:sid.color, lineHeight:1 }}>{days}</div>
                    <div style={{ fontSize:10, color:"#CCC", letterSpacing:1.5, fontWeight:600 }}>JOURS</div>
                  </div>
                )}
              </div>

              {/* Tracé */}
              <div style={{ height:188, background:"#FAFAFA", display:"flex", alignItems:"center", justifyContent:"center", borderTop:"0.5px solid #F0F0F0", borderBottom:"0.5px solid #F0F0F0", overflow:"hidden" }}>
                {imgUrl
                  ? <img src={imgUrl} alt={next?.circuit} style={{ width:"100%", height:"100%", objectFit:"contain" }} onError={e => e.target.style.display='none'}/>
                  : <div style={{ fontSize:40, opacity:.1 }}>🏁</div>
                }
              </div>

              {/* Prochain event */}
              <div style={{ padding:"12px 20px 15px", borderBottom:"0.5px solid #F5F5F5" }}>
                {next ? (
                  <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                    <div style={{ minWidth:0 }}>
                      <div style={{ fontSize:25, fontWeight:800, color:"#111", overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap" }}>{next.name}</div>
                      <div style={{ fontSize:12, color:"#BBB", marginTop:1, display:"flex", alignItems:"center", gap:6 }}>
                        <Flag country={next.country} size={12}/>
                        {fmtRange(next.date_start, next.date_end)}
                      </div>
                    </div>
                    {days === 0 && <span style={{ fontSize:12, fontWeight:700, color:"#fff", background:sid.color, padding:"4px 10px", borderRadius:25 }}>AUJ.</span>}
                  </div>
                ) : (
                  <div style={{ fontSize:15, color:"#DDD", textAlign:"center" }}>Saison terminée</div>
                )}
              </div>

              {/* Top 3 classement */}
              <div style={{ padding:"12px 20px 18px" }}>
                <div style={{ fontSize:10, fontWeight:700, letterSpacing:1.5, color:"#CCC", marginBottom:8 }}>CLASSEMENT</div>
                {top3.length === 0 && <div style={{ fontSize:14, color:"#DDD", textAlign:"center" }}>—</div>}
                {top3.map((r, i) => (
                  <div key={i} style={{ display:"flex", alignItems:"center", gap:10, marginBottom: i<2 ? 6 : 0 }}>
                    <div style={{ width:25, height:25, borderRadius:8, background: i===0?sid.color:i===1?"#C0C0C0":"#CD7F32", display:"flex", alignItems:"center", justifyContent:"center", fontSize:12, fontWeight:800, color:"#fff", flexShrink:0 }}>
                      {i+1}
                    </div>
                    <div style={{ flex:1, fontSize:20, fontWeight:700, color:"#222", overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap" }}>{r.name}</div>
                    <div style={{ fontSize:22, fontWeight:900, color:sid.color, flexShrink:0 }}>{r.points}</div>
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


export default function App() {
  const [series, setSeries] = useState([]);
  const [active, setActive] = useState("F1");
  const [view, setView] = useState("home"); // 'home' | 'series'
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

  const mainRaces = races.filter(r => r.type !== 'sprint' && !r.name?.toLowerCase().startsWith('sprint'));
  const sprintRounds = new Set(races.filter(r => r.type === 'sprint' || r.name?.toLowerCase().startsWith('sprint')).map(r => r.round));
  const sprintByRound = Object.fromEntries(races.filter(r => r.type === 'sprint' || r.name?.toLowerCase().startsWith('sprint')).map(r => [r.round, r]));
  const displayed = filter==="upcoming"
    ? mainRaces.filter(r => r.date_end >= today)
    : filter==="results"
    ? mainRaces.filter(r => r.status === "done").reverse()
    : mainRaces;
  const next = races.find(r=>r.date_start>=today&&r.status!=="done"&&r.type!=="sprint");
  const dNext = next?daysUntil(next.date_start):null;
  const doneCount = races.filter(r=>r.status==="done"&&r.type!=="sprint").length;
  const totalCount = races.filter(r=>r.type!=="sprint").length;

  return (
    <div style={{ minHeight:"100vh", background:"#F2F2F0", fontFamily:"'Barlow Condensed','Arial Narrow',sans-serif" }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&display=swap');
        @keyframes spin{to{transform:rotate(360deg)}}
        @keyframes pulse{0%,100%{opacity:1}50%{opacity:.5}}
        @keyframes slideUp{from{opacity:0;transform:translateY(12px)}to{opacity:1;transform:none}}
        *{box-sizing:border-box}
        button{font-family:inherit}
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
        @media(min-width:1125px){
          .inner{padding:0 50px}
          .tile-track{height:175px}
          .tile-name{font-size:20px}
          .tile-day{font-size:32px}
          .stab{font-size:19px;padding:15px 28px}
          .next-name{font-size:40px !important}
          .next-days{font-size:75px !important}
        }
        /* ── Mobile : header compact ── */
        @media(max-width:899px){
          .header-logo{display:none !important}
          .stab{padding:9px 12px !important;font-size:14px !important}
          .stab-label{display:none !important}
          .stab-home-label{display:none !important}
          .app-inner{padding:0 10px !important}
          .tiles{grid-template-columns:1fr !important}
          .circuit-panel-inner{grid-template-columns:1fr !important}
          .inner{padding:0 10px !important}
        }
      `}</style>

      {/* ── TOP BAR ── */}
      <div style={{ background:"#fff", borderBottom:"0.5px solid #EFEFEF", position:"sticky", top:0, zIndex:20 }}>
        <div className="inner">
          <div className="header-stripe" style={{ height:4, background:id.color, margin:"0 -40px 0 -40px" }}/>
          <div style={{ display:"flex", alignItems:"center", paddingTop:10, paddingBottom:2, gap:4, overflowX:"auto", scrollbarWidth:"none" }}>
            {/* Logo — caché sur mobile */}
            <div className="header-logo" style={{ marginRight:14, flexShrink:0, paddingBottom:8 }}>
              <div style={{ fontSize:11, fontWeight:700, letterSpacing:3, color:"#BBB" }}>CALENDRIER</div>
              <div style={{ fontSize:32, fontWeight:900, color:"#111" }}>MOTORSPORT <span style={{ color:id.color }}>2026</span></div>
            </div>
            {/* Bouton Accueil */}
            <button className="stab" style={{ '--sc':'#666', color: view==='home'?'#444':'#BBB', borderBottomColor: view==='home'?'#444':'transparent', fontWeight: view==='home'?800:600, flexShrink:0 }}
              onClick={() => setView('home')}>
              🏠<span className="stab-home-label"> Accueil</span>
            </button>
            {/* Onglets séries */}
            {series.map(s => {
              const sid = SERIES_ID[s.id] || {};
              const isA = active === s.id && view === 'series';
              return (
                <button key={s.id} className={`stab${isA?' active':''}`}
                  style={{ '--sc': sid.color, color: isA ? sid.color : '#BBB', flexShrink:0 }}
                  onClick={() => { setActive(s.id); setView('series'); }}>
                  {sid.icon}<span className="stab-label"> {s.id}</span>
                </button>
              );
            })}
          </div>
        </div>
      </div>

      {/* ── CONTENU ── */}
      <div className="inner" style={{ paddingTop:24, paddingBottom:60 }}>
        {/* ── HOME DASHBOARD ── */}
        {view === 'home' && (
          <HomeDashboard series={series} onSelect={sid => { setActive(sid); setView('series'); }} id={id}/>
        )}

        {/* ── VUE SÉRIE ── */}
        {view === 'series' && loading && <Spinner color={id.color}/>}
        {view === 'series' && !loading && <>

        {/* Banner prochaine course */}
        {!loading && next && (
          <div style={{ background:`linear-gradient(135deg,${id.color},${id.color}CC)`, borderRadius:18, padding:"22px 35px", display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom:20, animation:"slideUp .3s ease" }}>
            <div>
              <div style={{ fontSize:11, fontWeight:700, letterSpacing:3, color:"rgba(255,255,255,.55)", marginBottom:3 }}>PROCHAINE COURSE</div>
              <div className="next-name" style={{ fontSize:40, fontWeight:900, color:"#fff" }}>{next.name}</div>
              <div style={{ fontSize:15, color:"rgba(255,255,255,.65)", marginTop:3, display:"flex", alignItems:"center", gap:8 }}>
                <Flag country={next.country} size={14}/>
                {fmtRange(next.date_start, next.date_end)}{next.circuit ? ` — ${next.circuit}` : ''}
              </div>
            </div>
            <div style={{ textAlign:"right" }}>
              {daysUntil(next.date_start) === 0
                ? <div style={{ fontSize:22, fontWeight:900, color:"#fff" }}>AUJOURD'HUI !</div>
                : <>
                  <div className="next-days" style={{ fontSize:80, fontWeight:900, color:"#fff", lineHeight:1 }}>{daysUntil(next.date_start)}</div>
                  <div style={{ fontSize:11, color:"rgba(255,255,255,.5)", letterSpacing:2 }}>JOURS</div>
                </>
              }
            </div>
          </div>
        )}

        {/* Barre de progression saison */}
        {!loading && totalCount > 0 && (
          <div style={{ marginBottom:16 }}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:4 }}>
              <span style={{ fontSize:14, color:"#BBB", fontWeight:600 }}>SAISON 2026 — {doneCount}/{totalCount} GP</span>
              <span style={{ fontSize:14, color:id.color, fontWeight:700 }}>{Math.round((doneCount/totalCount)*100)}%</span>
            </div>
            <div style={{ height:3, background:"#E8E8E8", borderRadius:2, overflow:"hidden" }}>
              <div style={{ height:"100%", width:`${Math.round((doneCount/totalCount)*100)}%`, background:id.color, borderRadius:2, transition:"width .5s" }}/>
            </div>
          </div>
        )}

        {/* Filtres */}
        {!loading && (
          <div style={{ display:"flex", gap:8, marginBottom:20 }}>
            {[["upcoming","À venir"],["all","Calendrier"],["results","Résultats"],["standings","Classement"]].map(([v,l]) => (
              <button key={v} className={`fbtn${filter===v?' active':''}`}
                style={{ '--sc':id.color, background: filter===v ? id.color : '#fff' }}
                onClick={() => setFilter(v)}>{l}</button>
            ))}
          </div>
        )}

        {/* Classement */}
        {!loading && filter === "standings" && (
          <div style={{ animation:"slideUp .25s ease" }}>
            <StandingsPanel seriesId={active} id={id}/>
          </div>
        )}

        {/* Tuiles */}
        {!loading && filter !== "standings" && (
          <div className="tiles" style={{ animation:"slideUp .25s ease" }}>
            {displayed.length === 0 && (
              <div style={{ gridColumn:"1/-1", textAlign:"center", color:"#CCC", padding:60, fontSize:20 }}>Aucune course</div>
            )}
            {displayed.map(race => {
              const done = race.status === "done";
              const live = race.status === "live";
              const isNext = next?.id === race.id;
              const days = daysUntil(race.date_start);
              const key = getTrackKey(race.circuit, race.series_id, race.circuit_key);
              const imgUrl = key ? TRACK_IMAGES[key] : null;
              return (
                <div key={race.id}>
                  <div
                    className={`tile${done?' done':''}${isNext?' next-race':''}`}
                    style={{ '--sc': id.color }}
                    onClick={() => { const next = selected?.id === race.id ? null : race; setSelected(next); if (next) setTimeout(()=>document.getElementById('circuit-panel')?.scrollIntoView({behavior:'smooth',block:'nearest'}),50); }}
                  >
                    <div className="tile-top">
                      <div className="tile-date">
                        <div className={`tile-day${done?' past':''}`}>{new Date(race.date_start+"T12:00:00").getDate()}</div>
                        <div className="tile-month">{MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}</div>
                      </div>
                      <Flag country={race.country} size={20}/>
                    </div>
                    <div className="tile-track">
                      {imgUrl
                        ? <img src={imgUrl} alt={race.circuit} onError={e => e.target.style.display='none'}/>
                        : <div style={{ fontSize:45, opacity:.1 }}>🏁</div>
                      }
                    </div>
                    <div className="tile-foot">
                      <div className={`tile-name${done?' past':''}`}>{race.name}</div>
                      <div className="tile-circuit">{race.circuit}</div>
                      <div className="tile-badges">
                        {live && <span className="badge" style={{ background:id.color, color:"#fff", animation:"pulse 1.4s infinite" }}>LIVE</span>}
                        {isNext && <span className="badge b-next" style={{ background:id.color }}>Prochain</span>}
                        {done && race._hasResults && <span className="badge b-res">Résultats</span>}
                        {sprintRounds.has(race.round) && <span className="badge b-sprint">Sprint</span>}
                        {!done && !isNext && days !== null && days >= 0 && <span className="badge b-days">{days}j</span>}
                      </div>
                    </div>
                  </div>
                </div>
              );
            })}
            {/* Panel pleine largeur — après toutes les tuiles */}
            {selected && (
              <div id="circuit-panel" style={{ gridColumn:"1/-1", animation:"expandDown .25s cubic-bezier(.4,0,.2,1)" }}>
                <CircuitPanel race={selected} id={id} sprintRace={sprintByRound[selected.round]||null} onClose={() => setSelected(null)}/>
              </div>
            )}
          </div>
        )}

        </>
        }{/* ── FIN VUE SÉRIE ── */}

        {/* Footer */}
        {!loading && (
          <div style={{ marginTop:24, padding:"15px 25px", background:"#fff", borderRadius:12, border:"0.5px solid #EFEFEF", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
            <span style={{ fontSize:15, color:"#CCC", fontWeight:600, letterSpacing:1 }}>{races.length} COURSES · SUPABASE · 2026</span>
            <span style={{ fontSize:15, fontWeight:800, color:"#BBB" }}>MOTORSPORT 2026</span>
          </div>
        )}
      </div>
    </div>
  );
}