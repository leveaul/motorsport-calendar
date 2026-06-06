import { SUPABASE_URL, SUPABASE_KEY, TRACK_IMAGES, MONTHS_FR } from './config';

const H = { "apikey": SUPABASE_KEY, "Authorization": `Bearer ${SUPABASE_KEY}` };

export async function sb(path) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, { headers: H });
  if (!r.ok) throw new Error(await r.text());
  return r.json();
}

export function fmtDate(d) {
  if (!d) return "";
  const x = new Date(d + "T12:00:00");
  return `${x.getDate()} ${MONTHS_FR[x.getMonth()]}`;
}

export function fmtRange(s, e) {
  if (!s) return "";
  if (!e || s === e) return fmtDate(s);
  const a = new Date(s + "T12:00:00"), b = new Date(e + "T12:00:00");
  if (a.getMonth() === b.getMonth())
    return `${a.getDate()}-${b.getDate()} ${MONTHS_FR[a.getMonth()]}`;
  return `${fmtDate(s)} → ${fmtDate(e)}`;
}

export function fmtSession(dtStr, utc) {
  const d = new Date(dtStr);
  if (utc) {
    const day  = d.toLocaleDateString("fr-FR", { weekday:"short", timeZone:"UTC" });
    const time = d.toLocaleTimeString("fr-FR", { hour:"2-digit", minute:"2-digit", timeZone:"UTC", hour12:false });
    return `${day} ${time}`;
  }
  const tz   = Intl.DateTimeFormat().resolvedOptions().timeZone;
  const day  = d.toLocaleDateString("fr-FR", { weekday:"short", timeZone:tz });
  const time = d.toLocaleTimeString("fr-FR", { hour:"2-digit", minute:"2-digit", timeZone:tz, hour12:false });
  return `${day} ${time}`;
}

export function daysUntil(d) {
  if (!d) return null;
  const t = new Date(); t.setHours(0,0,0,0);
  const x = new Date(d + "T00:00:00"); x.setHours(0,0,0,0);
  return Math.ceil((x - t) / 86400000);
}

export function getTrackKey(circuit, seriesId, circuitKey) {
  if (circuitKey) return circuitKey;
  if (!circuit) return null;
  const c = circuit.toLowerCase();

  if (seriesId === "MotoGP") {
    if (c.includes("buriram")||c.includes("chang"))                    return "motogp_tha";
    if (c.includes("goiania")||c.includes("senna"))                    return "motogp_bra";
    if (c.includes("americas")||c.includes("cota")||c.includes("austin")) return "motogp_usa";
    if (c.includes("jerez")||c.includes("angel nieto"))                return "motogp_spa";
    if (c.includes("bugatti")||c.includes("le mans"))                  return "motogp_fra";
    if (c.includes("catalunya")||c.includes("barcelona"))              return "motogp_cat";
    if (c.includes("mugello"))                                          return "motogp_ita";
    if (c.includes("balaton"))                                          return "motogp_hun";
    if (c.includes("brno")||c.includes("automotodrom"))                return "motogp_cze";
    if (c.includes("assen"))                                            return "motogp_nld";
    if (c.includes("sachsenring"))                                      return "motogp_ger";
    if (c.includes("silverstone"))                                      return "motogp_gbr";
    if (c.includes("aragon")||c.includes("motorland"))                 return "motogp_ara";
    if (c.includes("misano")||c.includes("simoncelli"))                return "motogp_rsm";
    if (c.includes("red bull ring")||c.includes("spielberg"))          return "motogp_aut";
    if (c.includes("motegi"))                                           return "motogp_jpn";
    if (c.includes("mandalika")||c.includes("pertamina"))              return "motogp_ina";
    if (c.includes("phillip island"))                                   return "motogp_aus";
    if (c.includes("sepang")||c.includes("petronas"))                  return "motogp_mal";
    if (c.includes("lusail")||c.includes("losail"))                    return "motogp_qat";
    if (c.includes("algarve")||c.includes("portimao"))                 return "motogp_por";
    if (c.includes("valencia")||c.includes("tormo"))                   return "motogp_val";
    return null;
  }

  if (["WEC","ELMS","GTWCE","IMSA"].includes(seriesId)) {
    if (c.includes("lusail")||c.includes("losail"))                    return "wec_losail";
    if (c.includes("imola")||c.includes("dino ferrari"))               return "wec_imola";
    if (c.includes("spa"))                                              return "wec_spa";
    if (c.includes("sarthe")||(c.includes("mans")&&!c.includes("bugatti"))) return "wec_lemans";
    if (c.includes("interlagos")||c.includes("são paulo")||c.includes("sao paulo")||c.includes("paulo")) return "wec_saopaulo";
    if (c.includes("americas")||c.includes("cota")||c.includes("austin")) return "wec_cota";
    if (c.includes("fuji"))                                             return "wec_fuji";
    if (c.includes("bahrain")||c.includes("sakhir"))                   return "wec_bahrain";
    if (c.includes("portimao")||c.includes("algarve"))                 return "wec_portimao";
    return null;
  }

  if (seriesId === "WRC") {
    if (c.includes("monte")||c.includes("monaco"))                     return "wrc_montecarlo";
    if (c.includes("sweden")||c.includes("suède")||c.includes("umea")) return "wrc_sweden";
    if (c.includes("kenya")||c.includes("safari"))                     return "wrc_kenya";
    if (c.includes("croatia")||c.includes("croatie"))                  return "wrc_croatia";
    if (c.includes("canaria")||c.includes("palmas"))                   return "wrc_canarias";
    if (c.includes("portugal")||c.includes("matosinhos"))              return "wrc_portugal";
    if (c.includes("japan")||c.includes("japon")||c.includes("toyota")) return "wrc_japan";
    if (c.includes("greece")||c.includes("acropolis")||c.includes("grèce")) return "wrc_greece";
    if (c.includes("estonia")||c.includes("tartu"))                    return "wrc_estonia";
    if (c.includes("finland")||c.includes("finlande")||c.includes("jyv")) return "wrc_finland";
    if (c.includes("paraguay"))                                         return "wrc_paraguay";
    if (c.includes("chile")||c.includes("chili"))                      return "wrc_chile";
    if (c.includes("italy")||c.includes("italie"))                     return "wrc_italy";
    if (c.includes("saudi")||c.includes("arabie"))                     return "wrc_saudi";
    return null;
  }

  // F1 fallback
  if (c.includes("monaco"))                                            return "f1_monaco";
  if (c.includes("monza"))                                             return "f1_monza";
  if (c.includes("silverstone"))                                       return "f1_silverstone";
  if (c.includes("spa"))                                               return "f1_spa";
  if (c.includes("suzuka"))                                            return "f1_suzuka";
  if (c.includes("albert park"))                                       return "f1_albertpark";
  if (c.includes("red bull ring")||c.includes("spielberg"))           return "f1_redbullring";
  if (c.includes("catalunya")||c.includes("barcelona"))               return "f1_barcelona";
  if (c.includes("zandvoort"))                                         return "f1_zandvoort";
  if (c.includes("hungaroring")||c.includes("budapest"))              return "f1_hungaroring";
  if (c.includes("imola"))                                             return "f1_imola";
  if (c.includes("yas marina"))                                        return "f1_yasmarina";
  if (c.includes("americas")||c.includes("cota")||c.includes("austin")) return "f1_cota";
  if (c.includes("baku")||c.includes("azerbaijan"))                   return "f1_baku";
  if (c.includes("lusail")||c.includes("losail"))                     return "f1_losail";
  if (c.includes("marina bay")||c.includes("singapore"))              return "f1_marinabay";
  if (c.includes("gilles villeneuve")||c.includes("montreal"))        return "f1_montreal";
  if (c.includes("interlagos")||c.includes("são paulo")||c.includes("sao paulo")) return "f1_interlagos";
  if (c.includes("jeddah")||c.includes("corniche"))                   return "f1_jeddah";
  if (c.includes("miami"))                                             return "f1_miami";
  if (c.includes("las vegas"))                                         return "f1_lasvegas";
  if (c.includes("shanghai"))                                          return "f1_shanghai";
  if (c.includes("bahrain")||c.includes("sakhir"))                    return "f1_bahrain";
  if (c.includes("hermanos")||c.includes("mexico"))                   return "f1_mexicocity";
  if (c.includes("madrid")||c.includes("ifema")||c.includes("madring")) return "f1_madrid";
  return null;
}

export function getImgUrl(race) {
  const key = getTrackKey(race.circuit, race.series_id, race.circuit_key);
  return key ? TRACK_IMAGES[key] : null;
}
