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
    if (c.includes("imola"))                                        return "wec_imola";
    if (c.includes("spa"))                                          return "wec_spa";
    if (c.includes("sarthe") || (c.includes("mans") && !c.includes("bugatti"))) return "wec_lemans";
    if (c.includes("interlagos") || c.includes("são paulo") || c.includes("sao paulo")) return "wec_saopaulo";
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
  return null;
}


function TrackSVG({ circuit, color, size=140, seriesId='', circuitKey=null }) {
  const key = getTrackKey(circuit, seriesId, circuitKey);
  const imgUrl = key ? TRACK_IMAGES[key] : null;
  const [error, setError] = useState(false);
  useEffect(() => { setError(false); }, [circuit]);

  if (!imgUrl || error) return (
    <div style={{ width:"100%", height:"100%", display:"flex", alignItems:"center", justifyContent:"center" }}>
      <div style={{ fontSize:10, color:"#CCC", textAlign:"center" }}>{circuit || "Circuit"}</div>
    </div>
  );
  return (
    <div style={{ width:"100%", height:"100%", display:"flex", alignItems:"center", justifyContent:"center" }}>
      <img src={imgUrl} alt={circuit} onError={() => setError(true)}
        style={{ maxWidth:"100%", maxHeight:"100%", objectFit:"contain" }} />
    </div>
  );
}

const CIRCUIT_INFO = {
  // ── F1 ───────────────────────────────────────────────────────────────────
  f1_monaco:    { lap:"3.337 km", turns:19, record:"1:12.909 - Hamilton (2021)",         first:"F1: 1950" },
  f1_monza:     { lap:"5.793 km", turns:11, record:"1:19.119 - Leclerc (2019)",           first:"F1: 1950" },
  silverstone:  { lap:"5.891 km", turns:18, record:"1:27.097 - Verstappen (2020)",        first:"F1: 1950" },
  f1_spa:       { lap:"7.004 km", turns:19, record:"1:41.252 - Bottas (2018)",             first:"F1: 1950" },
  f1_suzuka:    { lap:"5.807 km", turns:18, record:"1:30.983 - Hamilton (2019)",          first:"F1: 1987" },
  albertpark:   { lap:"5.278 km", turns:16, record:"1:19.813 - Leclerc (2022)",           first:"F1: 1996" },
  redbullring:  { lap:"4.318 km", turns:10, record:"1:05.619 - Hamilton (2020)",          first:"F1: 1970" },
  f1_barcelona:    { lap:"4.657 km", turns:16, record:"1:16.330 - Verstappen (2023)",        first:"F1: 1991" },
  f1_zandvoort:    { lap:"4.259 km", turns:14, record:"1:11.097 - Verstappen (2021)",        first:"F1: 1952, retour 2021" },
  hungaroring:  { lap:"4.381 km", turns:14, record:"1:16.627 - Hamilton (2020)",          first:"F1: 1986" },
  f1_imola:     { lap:"4.909 km", turns:19, record:"1:15.484 - Hamilton (2020)",          first:"F1: 1980" },
  f1_yasmarina:    { lap:"5.281 km", turns:16, record:"1:26.103 - Verstappen (2021)",        first:"F1: 2009" },
  f1_cota:      { lap:"5.513 km", turns:20, record:"1:36.169 - Hamilton (2012)",          first:"F1: 2012" },
  f1_baku:      { lap:"6.003 km", turns:20, record:"1:43.009 - Leclerc (2019)",           first:"F1: 2017" },
  f1_losail:    { lap:"5.380 km", turns:16, record:"1:24.319 - Hamilton (2021)",          first:"F1: 2021" },
  f1_marinabay:    { lap:"4.940 km", turns:19, record:"1:35.867 - Leclerc (2023)",           first:"F1: 2008" },
  f1_montreal:    { lap:"4.361 km", turns:14, record:"1:13.078 - Vettel (2019)",            first:"F1: 1978" },
  interlagos:   { lap:"4.309 km", turns:15, record:"1:10.540 - Verstappen (2023)",        first:"F1: 1973" },
  f1_jeddah:    { lap:"6.174 km", turns:27, record:"1:30.734 - Leclerc (2022)",           first:"F1: 2021" },
  f1_miami:     { lap:"5.412 km", turns:19, record:"1:29.708 - Verstappen (2023)",        first:"F1: 2022" },
  f1_lasvegas:    { lap:"6.201 km", turns:17, record:"1:35.490 - Leclerc (2023)",           first:"F1: 2023" },
  f1_shanghai:    { lap:"5.451 km", turns:16, record:"1:32.238 - Schumacher (2004)",        first:"F1: 2004" },
  f1_bahrain:    { lap:"5.412 km", turns:15, record:"1:31.447 - De la Rosa (2005)",        first:"F1: 2004" },
  mexicocity:   { lap:"4.304 km", turns:17, record:"1:17.774 - Bottas (2021)",            first:"F1: 1963" },

  // ── MotoGP — records all-time au 17 mai 2026 (source: motorsporttickets.com) ──
  motogp_tha:   { lap:"4.554 km", turns:12, record:"1:28.526 - Bezzecchi/Aprilia (2026)",  first:"MotoGP: 2018" },
  motogp_bra:   { lap:"4.212 km", turns:14, record:"1:17.408 - Bezzecchi/Aprilia (2026)",  first:"MotoGP: 2026" },
  motogp_usa:   { lap:"5.513 km", turns:20, record:"2:00.864 - Di Giannantonio/Ducati (2026)", first:"MotoGP: 2013" },
  motogp_spa:   { lap:"4.423 km", turns:13, record:"1:35.610 - Quartararo/Yamaha (2025)",  first:"MotoGP: 1992" },
  motogp_fra:   { lap:"4.185 km", turns:14, record:"1:29.288 - M.Marquez/Ducati (2026)",   first:"MotoGP: 2000" },
  motogp_cat:   { lap:"4.657 km", turns:16, record:"1:37.536 - A.Marquez/Ducati (2025)",   first:"MotoGP: 1992" },
  motogp_ita:   { lap:"5.245 km", turns:15, record:"1:44.169 - M.Marquez/Ducati (2025)",   first:"MotoGP: 1994" },
  motogp_hun:   { lap:"4.197 km", turns:13, record:"1:36.518 - M.Marquez/Ducati (2025)",   first:"MotoGP: 2024" },
  motogp_cze:   { lap:"5.403 km", turns:14, record:"1:52.303 - Bagnaia/Ducati (2025)",     first:"MotoGP: 1987" },
  motogp_nld:   { lap:"4.542 km", turns:18, record:"1:30.540 - Bagnaia/Ducati (2024)",     first:"MotoGP: 1949" },
  motogp_ger:   { lap:"3.671 km", turns:13, record:"1:19.071 - Di Giannantonio/Ducati (2025)", first:"MotoGP: 1998" },
  motogp_gbr:   { lap:"5.900 km", turns:18, record:"1:57.233 - Quartararo/Yamaha (2025)",  first:"MotoGP: 1987" },
  motogp_ara:   { lap:"5.344 km", turns:17, record:"1:45.704 - M.Marquez/Ducati (2025)",   first:"MotoGP: 2010" },
  motogp_rsm:   { lap:"4.226 km", turns:16, record:"1:30.031 - Bagnaia/Ducati (2024)",     first:"MotoGP: 1993" },
  motogp_aut:   { lap:"4.318 km", turns:10, record:"1:27.748 - Martin/Ducati (2024)",      first:"MotoGP: 2016" },
  motogp_jpn:   { lap:"4.801 km", turns:14, record:"1:42.911 - Bagnaia/Ducati (2025)",     first:"MotoGP: 1999" },
  motogp_ina:   { lap:"4.310 km", turns:17, record:"1:28.832 - Bezzecchi/Aprilia (2025)",  first:"MotoGP: 2021" },
  motogp_aus:   { lap:"4.448 km", turns:12, record:"1:26.465 - Quartararo/Yamaha (2025)",  first:"MotoGP: 1997" },
  motogp_mal:   { lap:"5.543 km", turns:15, record:"1:56.337 - Bagnaia/Ducati (2024)",     first:"MotoGP: 1999" },
  motogp_qat:   { lap:"5.380 km", turns:16, record:"1:50.499 - M.Marquez/Ducati (2025)",   first:"MotoGP: 2004" },
  motogp_por:   { lap:"4.653 km", turns:15, record:"1:37.226 - M.Marquez/Honda (2023)",    first:"MotoGP: 2020" },
  motogp_val:   { lap:"4.005 km", turns:14, record:"1:28.809 - Bezzecchi/Aprilia (2025)",  first:"MotoGP: 1999" },

  // ── WEC ─────────────────────────────────────────────────────────────────
  wec_losail:   { lap:"5.380 km",  turns:16, record:"3:26.359 - Kobayashi/Toyota (2024)",  first:"WEC: 2024" },
  wec_imola:    { lap:"4.909 km",  turns:19, record:"1:28.920 - Giovinazzi/Ferrari (2025)", first:"WEC: 2024" },
  wec_spa:      { lap:"7.004 km",  turns:19, record:"2:01.649 - Kobayashi/Toyota (2024)",  first:"WEC: 2012" },
  wec_lemans:   { lap:"13.626 km", turns:38, record:"3:14.791 - Kobayashi/Toyota (2017)",  first:"24H: 1923" },
  wec_saopaulo: { lap:"4.309 km",  turns:15, record:"1:43.627 - Hartley/Toyota (2025)",    first:"WEC: 2025" },
  wec_cota:     { lap:"5.513 km",  turns:20, record:"1:50.932 - Bamber/Porsche (2025)",    first:"WEC: 2025" },
  wec_fuji:     { lap:"4.563 km",  turns:16, record:"1:26.048 - Kobayashi/Toyota (2019)",  first:"WEC: 2012" },
  wec_bahrain:  { lap:"5.412 km",  turns:15, record:"1:42.321 - Buemi/Toyota (2023)",      first:"WEC: 2012" },
  wec_portimao: { lap:"4.653 km",  turns:15, record:"1:33.886 - Buemi/Toyota (2021)",      first:"WEC: 2021" },

  default:      { lap:"--", turns:"--", record:"--", first:"--" },
};

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
    <div style={{ width:28, height:28, borderRadius:"50%", border:`3px solid ${color}30`, borderTop:`3px solid ${color}`, animation:"spin .7s linear infinite" }}/>
  </div>;
}

function CircuitPanel({ race, id, onClose }) {
  const [results, setResults] = useState([]);
  const [loadingR, setLoadingR] = useState(true);
  const key = getTrackKey(race.circuit, race.series_id, race.circuit_key);
  const info = CIRCUIT_INFO[key] || CIRCUIT_INFO.default;
  const MEDALS = ["🥇","🥈","🥉"];

  useEffect(() => {
    if (race.status==="done") {
      sb(`results?race_id=eq.${race.id}&order=position.asc`).then(r => { setResults(r); setLoadingR(false); }).catch(()=>setLoadingR(false));
    } else setLoadingR(false);
  }, [race.id]);

  return (
    <div style={{ background:"#FAFAFA", border:`1.5px solid ${id.color}30`, borderTop:"none", borderRadius:"0 0 12px 12px", overflow:"hidden", animation:"slideDown .2s ease" }}>
      <div style={{ background:`linear-gradient(135deg,${id.color},${id.color}BB)`, padding:"12px 16px", display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <Flag country={race.country} size={24}/>
          <div>
            <div className="panel-title" style={{ fontSize:16, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
            <div className="panel-sub" style={{ fontSize:10, color:"rgba(255,255,255,.7)", marginTop:1 }}>{race.circuit}</div>
          </div>
        </div>
        <button onClick={onClose} style={{ background:"rgba(255,255,255,.2)", border:"none", color:"#fff", width:26, height:26, borderRadius:6, cursor:"pointer", fontSize:13 }}>X</button>
      </div>
      <div className="circuit-panel-inner" style={{ padding:"12px 16px", display:"grid", gridTemplateColumns:"1fr 1fr", gap:10 }}>
        <div style={{ background:"#fff", borderRadius:10, border:`1px solid ${id.color}15`, padding:12, display:"flex", flexDirection:"column", alignItems:"center" }}>
          <div style={{ fontSize:9, color:"#BBB", letterSpacing:1.5, marginBottom:6, fontWeight:700 }}>TRACE</div>
          <div className="track-img-wrap" style={{ width:"100%", height:180, display:"flex", alignItems:"center", justifyContent:"center" }}>
            <TrackSVG circuit={race.circuit} color={id.color} size={160} seriesId={race.series_id} circuitKey={race.circuit_key}/>
          </div>
        </div>
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {[["📏","Longueur",info.lap],["↩️","Virages",info.turns !== "--" ? `${info.turns}` : "--"],["⏱️","Record",info.record],["📅","Date",fmtRange(race.date_start,race.date_end)],["🗓️","Au calendrier",info.first]].map(([emoji,label,val]) => (
            <div key={label} style={{ background:"#fff", borderRadius:8, border:"1px solid #F0F0F0", padding:"6px 9px", display:"flex", alignItems:"flex-start", gap:7 }}>
              <span style={{ fontSize:13, flexShrink:0, marginTop:1 }}>{emoji}</span>
              <div style={{ flex:1, minWidth:0 }}>
                <div className="info-label" style={{ fontSize:8, color:"#CCC", letterSpacing:1, fontWeight:700 }}>{label.toUpperCase()}</div>
                <div className="info-value" style={{ fontSize:11, fontWeight:700, color:"#222", fontFamily:"'Barlow Condensed',sans-serif", lineHeight:1.3 }}>{val}</div>
              </div>
            </div>
          ))}
        </div>
      </div>
      {race.status==="done" ? (
        <div style={{ padding:"0 16px 12px" }}>
          <div style={{ fontSize:9, fontWeight:700, color:"#BBB", letterSpacing:1.5, marginBottom:7 }}>RESULTATS</div>
          {loadingR && <Spinner color={id.color}/>}
          {!loadingR && results.length===0 && <div style={{ textAlign:"center", color:"#DDD", fontSize:12, padding:"8px 0" }}>Pas encore de resultats</div>}
          {!loadingR && results.length>0 && (
            <div style={{ display:"flex", flexDirection:"column", gap:4 }}>
              {results.map((r,i) => (
                <div key={i} style={{ display:"flex", alignItems:"center", gap:9, padding:"7px 9px", background:i===0?id.bg:"#fff", border:`1px solid ${i===0?id.color+"30":"#F0F0F0"}`, borderRadius:8 }}>
                  <div style={{ width:25, height:25, borderRadius:6, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#F5F5F5", display:"flex", alignItems:"center", justifyContent:"center", fontSize:i<3?12:10, fontWeight:800, color:i<3?"#fff":"#AAA", flexShrink:0 }}>
                    {i<3?["🥇","🥈","🥉"][i]:r.position}
                  </div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div className="result-driver" style={{ fontSize:13, fontWeight:700, color:i===0?id.text:"#222", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{r.driver}</div>
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
        {[["driver","Pilotes"],["team","Equipes"]].map(([v,l])=>(
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
                <div className="standings-name" style={{ fontSize:13, fontWeight:700, color:i===0?"#111":"#333", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.name}</div>
                {s.nationality&&<div style={{ fontSize:10, color:"#AAA" }}>{s.nationality}</div>}
                <div style={{ marginTop:4, height:3, background:"#F0F0F0", borderRadius:2, overflow:"hidden" }}>
                  <div style={{ height:"100%", width:`${Math.round((s.points/maxPts)*100)}%`, background:i===0?id.color:i===1?"#C0C0C0":i===2?"#CD7F32":"#E0E0E0", borderRadius:2 }}/>
                </div>
              </div>
              <div style={{ textAlign:"right", flexShrink:0 }}>
                <div className="standings-pts" style={{ fontSize:20, fontWeight:900, lineHeight:1, color:i===0?id.color:"#CCC", fontFamily:"'Barlow Condensed',sans-serif" }}>{s.points}</div>
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

function RaceCard({ race, id, active, onClick }) {
  const today = new Date().toISOString().slice(0,10);
  const done = race.status==="done";
  const live = race.status==="live";
  const days = daysUntil(race.date_start);
  return (
    <div onClick={()=>onClick(race)} style={{ display:"flex", alignItems:"center", background:active?`${id.color}08`:"#FFFFFF", border:`1.5px solid ${active?id.color:live?id.color:"#E8E8E8"}`, borderLeft:`4px solid ${live?id.color:done?"#D0D0D0":id.color}`, borderRadius:active?"12px 12px 0 0":12, cursor:"pointer", transition:"all .15s", overflow:"hidden", opacity:done&&!race._hasResults?0.5:1 }}>
      <div style={{ minWidth:58, padding:"10px 4px", background:live?id.color:done?"#F5F5F5":id.bg, display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", flexShrink:0, gap:3 }}>
        <Flag country={race.country} size={18}/>
        <div className="race-day" style={{ fontSize:17, fontWeight:900, lineHeight:1, color:live?"#fff":done?"#AAA":id.color, fontFamily:"'Barlow Condensed',sans-serif" }}>{new Date(race.date_start+"T12:00:00").getDate()}</div>
        <div className="race-month" style={{ fontSize:8, fontWeight:600, letterSpacing:1, textTransform:"uppercase", color:live?"#ffffff99":done?"#BBB":id.text }}>{MONTHS_FR[new Date(race.date_start+"T12:00:00").getMonth()]}</div>
      </div>
      <div style={{ flex:1, padding:"9px 11px", minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:5, marginBottom:2, flexWrap:"wrap" }}>
          {live&&<span style={{ fontSize:8, fontWeight:700, letterSpacing:1.5, color:"#fff", background:id.color, padding:"2px 6px", borderRadius:4, animation:"pulse 1.4s infinite" }}>LIVE</span>}
          {race.type==="sprint"&&<span style={{ fontSize:8, fontWeight:700, color:"#FF6B00", background:"#FFF0E0", padding:"2px 6px", borderRadius:4 }}>SPRINT</span>}
          {race.type==="sprint_weekend"&&race.series_id==="MotoGP"&&<span style={{ fontSize:8, fontWeight:600, color:"#888", background:"#F2F2F2", padding:"2px 6px", borderRadius:4 }}>+ SPRINT SAM.</span>}
          {race.type==="sprint_weekend"&&race.series_id==="F1"&&<span style={{ fontSize:8, fontWeight:700, color:id.color, background:id.bg, padding:"2px 6px", borderRadius:4 }}>SPRINT WE</span>}
          {done&&race._hasResults&&<span style={{ fontSize:8, fontWeight:600, color:id.text, background:id.bg, padding:"2px 6px", borderRadius:4 }}>RESULTATS</span>}
          {race.type!=="sprint"&&race.type!=="sprint_weekend"&&race.round&&<span style={{ fontSize:9, color:"#CCC", fontWeight:600 }}>R{race.round}</span>}
        </div>
        <div className="race-name" style={{ fontSize:14, fontWeight:700, color:done?"#999":"#111", whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis", fontFamily:"'Barlow Condensed',sans-serif" }}>{race.name}</div>
        <div className="race-circuit" style={{ fontSize:10, color:"#BBB", marginTop:1, whiteSpace:"nowrap", overflow:"hidden", textOverflow:"ellipsis" }}>{race.circuit}</div>
      </div>
      {!done&&days!==null&&(
        <div style={{ padding:"0 10px", textAlign:"center", flexShrink:0 }}>
          {days===0?<div style={{ fontSize:10, fontWeight:800, color:id.color }}>AUJ.</div>
            :days>0?<><div className="days-left" style={{ fontSize:days<=99?20:14, fontWeight:900, color:days<=7?id.color:"#DDD", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{days}</div><div style={{ fontSize:8, color:"#DDD", letterSpacing:1, fontWeight:600 }}>J</div></>:null}
        </div>
      )}
      <div style={{ padding:"0 8px", color:active?id.color:"#DDD", fontSize:12, flexShrink:0 }}>{active?"▲":"▼"}</div>
    </div>
  );
}

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

  const displayed = filter==="upcoming"?races.filter(r=>r.date_end>=today):filter==="results"?races.filter(r=>r.status==="done").reverse():races;
  const next = races.find(r=>r.date_start>=today&&r.status!=="done"&&r.type!=="sprint");
  const dNext = next?daysUntil(next.date_start):null;
  const doneCount = races.filter(r=>r.status==="done"&&r.type!=="sprint").length;
  const totalCount = races.filter(r=>r.type!=="sprint").length;

  return (
    <div style={{ minHeight:"100vh", background:"#F4F4F4", fontFamily:"'Barlow Condensed','Arial Narrow',sans-serif", paddingBottom:60 }}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;800;900&display=swap');
        @keyframes spin{to{transform:rotate(360deg)}}
        @keyframes pulse{0%,100%{opacity:1}50%{opacity:.5}}
        @keyframes slideUp{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:none}}
        @keyframes slideDown{from{opacity:0;transform:translateY(-6px)}to{opacity:1;transform:none}}
        *{box-sizing:border-box} button{font-family:inherit}
        body{background:#F4F4F4}
        .app-inner{width:100%;max-width:640px;margin:0 auto;padding:0 16px}
        @media(min-width:900px){
          .app-inner{max-width:1100px;padding:0 40px}
          .race-grid{display:grid;grid-template-columns:1fr 1fr;gap:8px}
          .circuit-panel-inner{grid-template-columns:1fr 1fr !important}
          .track-img-wrap{height:220px !important}
        }
        @media(min-width:1400px){
          .app-inner{max-width:1300px}
          .track-img-wrap{height:280px !important}
        }
        @media(min-width:900px){
          /* Scale up toutes les polices sur PC */
          .app-inner .race-name    { font-size:18px !important }
          .app-inner .race-circuit { font-size:13px !important }
          .app-inner .race-day     { font-size:22px !important }
          .app-inner .race-month   { font-size:11px !important }
          .app-inner .days-left    { font-size:26px !important }
          .app-inner .badge        { font-size:11px !important; padding: 3px 8px !important }
          .app-inner .round-num    { font-size:12px !important }
          .app-inner .info-label   { font-size:10px !important }
          .app-inner .info-value   { font-size:14px !important }
          .app-inner .info-emoji   { font-size:16px !important }
          .app-inner .panel-title  { font-size:20px !important }
          .app-inner .panel-sub    { font-size:13px !important }
          .app-inner .result-driver{ font-size:16px !important }
          .app-inner .result-team  { font-size:12px !important }
          .app-inner .result-pts   { font-size:15px !important }
          .app-inner .result-gap   { font-size:11px !important }
          .app-inner .section-lbl  { font-size:11px !important }
          .app-inner .next-name    { font-size:22px !important }
          .app-inner .next-sub     { font-size:13px !important }
          .app-inner .next-days    { font-size:52px !important }
          .app-inner .progress-lbl { font-size:11px !important }
          .app-inner .tab-btn      { font-size:13px !important }
          .app-inner .series-tab   { font-size:14px !important }
          .app-inner .header-title { font-size:28px !important }
          .app-inner .header-sub   { font-size:13px !important }
          .app-inner .standings-pos{ font-size:22px !important }
          .app-inner .standings-name{ font-size:17px !important }
          .app-inner .standings-nat{ font-size:13px !important }
          .app-inner .standings-pts{ font-size:26px !important }
        }
      `}</style>
      <div style={{ position:"sticky", top:0, zIndex:20, background:"#fff", borderBottom:"1.5px solid #EFEFEF" }}>
        <div className="app-inner" style={{ maxWidth:"unset" }}>
          <div style={{ height:4, background:id.color, margin:"0 -16px" }}/>
          <div style={{ padding:"10px 0 0", display:"flex", alignItems:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", right:-5, top:-8, fontSize:72, opacity:.07, userSelect:"none" }}>{id.heroEmoji}</div>
            <div>
              <div style={{ fontSize:10, fontWeight:700, letterSpacing:3, color:"#BBB" }}>CALENDRIER</div>
              <div className="header-title" style={{ fontSize:21, fontWeight:900, color:"#111" }}>MOTORSPORT <span style={{ color:id.color }}>2026</span></div>
            </div>
          </div>
          <div style={{ display:"flex", marginTop:10, overflowX:"auto", scrollbarWidth:"none", borderBottom:"1.5px solid #F0F0F0" }}>
            {series.map(s=>{ const sid=SERIES_ID[s.id]||{}; const isA=active===s.id; return <button key={s.id} onClick={()=>setActive(s.id)} className="series-tab" style={{ padding:"7px 13px", border:"none", borderBottom:`3px solid ${isA?sid.color:"transparent"}`, background:"transparent", color:isA?sid.color:"#CCC", fontSize:11, fontWeight:isA?800:600, letterSpacing:.5, cursor:"pointer", whiteSpace:"nowrap", transition:"all .15s" }}>{sid.icon} {s.id}</button>; })}
          </div>
        </div>
      </div>
      <div className="app-inner">
        {next&&!loading&&(
          <div style={{ margin:"14px 0 10px", background:`linear-gradient(135deg,${id.color},${id.color}CC)`, borderRadius:14, padding:"14px 16px", display:"flex", justifyContent:"space-between", alignItems:"center", boxShadow:`0 4px 20px ${id.color}30`, animation:"slideUp .3s ease", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", right:14, top:"50%", transform:"translateY(-50%)", opacity:.15 }}><Flag country={next.country} size={60}/></div>
            <div>
              <div style={{ fontSize:8, fontWeight:700, letterSpacing:2.5, color:"rgba(255,255,255,.65)", marginBottom:3 }}>PROCHAINE COURSE</div>
              <div className="next-name" style={{ fontSize:17, fontWeight:900, color:"#fff", fontFamily:"'Barlow Condensed',sans-serif" }}>{next.name}</div>
              <div style={{ display:"flex", alignItems:"center", gap:6, marginTop:3 }}>
                <Flag country={next.country} size={14}/>
                <span style={{ fontSize:10, color:"rgba(255,255,255,.65)" }}>{fmtRange(next.date_start,next.date_end)}{next.circuit?` - ${next.circuit}`:""}</span>
              </div>
            </div>
            <div style={{ textAlign:"right", zIndex:1 }}>
              {dNext===0?<div style={{ fontSize:11, fontWeight:900, color:"#fff" }}>AUJOURD'HUI</div>
                :<><div className="next-days" style={{ fontSize:40, fontWeight:900, color:"#fff", lineHeight:1, fontFamily:"'Barlow Condensed',sans-serif" }}>{dNext}</div><div style={{ fontSize:9, color:"rgba(255,255,255,.6)", letterSpacing:2, fontWeight:600 }}>JOURS</div></>}
            </div>
          </div>
        )}
        {!loading&&totalCount>0&&(
          <div style={{ marginBottom:10 }}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:3 }}>
              <span style={{ fontSize:9, color:"#BBB", fontWeight:600 }}>SAISON 2026 - {doneCount}/{totalCount} GP</span>
              <span style={{ fontSize:9, color:id.color, fontWeight:700 }}>{Math.round((doneCount/totalCount)*100)}%</span>
            </div>
            <div style={{ height:3, background:"#E8E8E8", borderRadius:2, overflow:"hidden" }}>
              <div style={{ height:"100%", width:`${Math.round((doneCount/totalCount)*100)}%`, background:`linear-gradient(90deg,${id.color},${id.color}99)`, borderRadius:2, transition:"width .5s" }}/>
            </div>
          </div>
        )}
        <div style={{ display:"flex", gap:4, marginBottom:10, padding:"4px", background:"#E8E8E8", borderRadius:10 }}>
          {[["upcoming","A venir"],["all","Calendrier"],["results","Resultats"],["standings","Classement"]].map(([v,l])=>(
            <button key={v} onClick={()=>setFilter(v)} className="tab-btn" style={{ flex:1, padding:"6px 0", borderRadius:7, border:"none", background:filter===v?"#fff":"transparent", color:filter===v?id.color:"#AAA", fontSize:10, fontWeight:filter===v?800:600, cursor:"pointer", boxShadow:filter===v?"0 1px 4px rgba(0,0,0,0.08)":"none", transition:"all .15s" }}>{l}</button>
          ))}
        </div>
        {loading&&<Spinner color={id.color}/>}
        {!loading&&filter==="standings"&&<div style={{ animation:"slideUp .25s ease" }}><StandingsPanel seriesId={active} id={id}/></div>}
        {!loading&&filter!=="standings"&&(
          <div className="race-grid" style={{ display:"grid", gridTemplateColumns:"1fr", gap:5, animation:"slideUp .25s ease" }}>
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
          <span style={{ fontSize:9, color:"#CCC", fontWeight:600, letterSpacing:1 }}>{races.length} COURSES - SUPABASE</span>
          <span style={{ fontSize:9, fontWeight:800, color:id.color }}>{id.label.toUpperCase()} 2026</span>
        </div>}
      </div>
    </div>
  );
}
