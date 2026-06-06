export const SUPABASE_URL = "https://qgdcutklhgnlcrxuvgkn.supabase.co";
export const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFnZGN1dGtsaGdubGNyeHV2Z2tuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4NzQ0NjAsImV4cCI6MjA5NTQ1MDQ2MH0.ltV5jlQfoF4OS6078lwwRAV-q-IDN7biLzHzM1tkUI8";

export const SERIES_ID = {
  F1:    { label:"Formula 1",    color:"#E8002D", bg:"#FFF0F2", text:"#B0001F", icon:"🏎️", heroEmoji:"🏎️" },
  MotoGP:{ label:"MotoGP",       color:"#D50032", bg:"#FFF0F1", text:"#A50027", icon:"🏍️", heroEmoji:"🏍️" },
  WEC:   { label:"FIA WEC",      color:"#0066CC", bg:"#EFF6FF", text:"#004A9E", icon:"⏱️", heroEmoji:"⏱️" },
  ELMS:  { label:"ELMS",         color:"#00833E", bg:"#EDFAF3", text:"#006030", icon:"🏁", heroEmoji:"🏁" },
  IMSA:  { label:"IMSA",         color:"#0033A0", bg:"#EEF2FF", text:"#002280", icon:"🏆", heroEmoji:"🏆" },
  WRC:   { label:"WRC",          color:"#1A1A1A", bg:"#F2F2F2", text:"#1A1A1A", icon:"🚗", heroEmoji:"🚗" },
  GTWCE: { label:"GT WC Europe", color:"#FF6600", bg:"#FFF4EE", text:"#CC4400", icon:"🏆", heroEmoji:"🏆" },
};

const CDN = "https://cdn.jsdelivr.net/gh/leveaul/motorsport-calendar@main/public";

export const SERIES_LOGOS = {
  F1:     `${CDN}/logos/F1.svg.png`,
  MotoGP: `${CDN}/logos/MotoGP.png`,
  WEC:    `${CDN}/logos/WEC.png`,
  ELMS:   `${CDN}/logos/ELMS.png`,
  GTWCE:  `${CDN}/logos/GTWCE.png`,
  IMSA:   `${CDN}/logos/IMSA.png`,
  WRC:    `${CDN}/logos/WRC_Logo.png`,
};

export const COUNTRY_CODES = {
  "Australie":"au","Chine":"cn","Japon":"jp","Etats-Unis":"us","États-Unis":"us","Canada":"ca",
  "Monaco":"mc","Espagne":"es","Autriche":"at","Angleterre":"gb","Grande-Bretagne":"gb",
  "Belgique":"be","Hongrie":"hu","Pays-Bas":"nl","Italie":"it","Azerbaïdjan":"az",
  "Singapour":"sg","Mexique":"mx","Brésil":"br","Qatar":"qa","Abu Dhabi":"ae",
  "Bahreïn":"bh","Thaïlande":"th","Indonésie":"id","Malaisie":"my","France":"fr",
  "Portugal":"pt","Allemagne":"de","Arabie Saoudite":"sa","Grande Bretagne":"gb",
  "Suede":"se","Suède":"se","Kenya":"ke","Croatie":"hr","Estonie":"ee","Finlande":"fi",
  "Paraguay":"py","Chili":"cl","Grece":"gr","Grèce":"gr",
};

export const MONTHS_FR = ["Jan","Fev","Mar","Avr","Mai","Jun","Jul","Aou","Sep","Oct","Nov","Dec"];

const F1   = `${CDN}/tracks/f1`;
const MGPX = `${CDN}/tracks/motogp`;
const WECX = `${CDN}/tracks/wec`;
const ELMX = `${CDN}/tracks/elms`;
const GTW  = `${CDN}/tracks/gtwce`;
const IMS  = `${CDN}/tracks/imsa`;
const WRC  = `${CDN}/tracks/wrc`;

export const TRACK_IMAGES = {
  f1_monaco:`${F1}/monaco.webp`,         f1_silverstone:`${F1}/silverstone.webp`,
  f1_monza:`${F1}/monza.webp`,           f1_spa:`${F1}/spa.webp`,
  f1_suzuka:`${F1}/suzuka.webp`,         f1_albertpark:`${F1}/albertpark.webp`,
  f1_redbullring:`${F1}/redbullring.webp`,f1_barcelona:`${F1}/barcelona.webp`,
  f1_zandvoort:`${F1}/zandvoort.webp`,   f1_hungaroring:`${F1}/hungaroring.webp`,
  f1_imola:`${F1}/imola.webp`,           f1_yasmarina:`${F1}/yasmarina.webp`,
  f1_cota:`${F1}/cota.webp`,             f1_baku:`${F1}/baku.webp`,
  f1_losail:`${F1}/losail.webp`,         f1_marinabay:`${F1}/marinabay.webp`,
  f1_montreal:`${F1}/montreal.webp`,     f1_interlagos:`${F1}/interlagos.webp`,
  f1_jeddah:`${F1}/jeddah.webp`,         f1_miami:`${F1}/miami.webp`,
  f1_lasvegas:`${F1}/lasvegas.webp`,     f1_shanghai:`${F1}/shanghai.webp`,
  f1_bahrain:`${F1}/bahrain.webp`,       f1_mexicocity:`${F1}/mexicocity.webp`,
  f1_madrid:`${F1}/madrid.webp`,
  motogp_tha:`${MGPX}/tha.svg`,  motogp_bra:`${MGPX}/bra.svg`,  motogp_usa:`${MGPX}/usa.svg`,
  motogp_spa:`${MGPX}/spa.svg`,  motogp_fra:`${MGPX}/fra.svg`,  motogp_cat:`${MGPX}/cat.svg`,
  motogp_ita:`${MGPX}/ita.svg`,  motogp_hun:`${MGPX}/hun.svg`,  motogp_cze:`${MGPX}/cze.svg`,
  motogp_nld:`${MGPX}/nld.svg`,  motogp_ger:`${MGPX}/ger.svg`,  motogp_gbr:`${MGPX}/gbr.svg`,
  motogp_ara:`${MGPX}/ara.svg`,  motogp_rsm:`${MGPX}/rsm.svg`,  motogp_aut:`${MGPX}/aut.svg`,
  motogp_jpn:`${MGPX}/jpn.svg`,  motogp_ina:`${MGPX}/ina.svg`,  motogp_aus:`${MGPX}/aus.svg`,
  motogp_mal:`${MGPX}/mal.svg`,  motogp_qat:`${MGPX}/qat.svg`,  motogp_por:`${MGPX}/por.svg`,
  motogp_val:`${MGPX}/val.svg`,
  wec_losail:`${WECX}/losail.png`,   wec_imola:`${WECX}/imola.png`,
  wec_spa:`${WECX}/spa.png`,         wec_lemans:`${WECX}/lemans.png`,
  wec_saopaulo:`${WECX}/saopaulo.png`,wec_cota:`${WECX}/cota.png`,
  wec_fuji:`${WECX}/fuji.png`,       wec_bahrain:`${WECX}/bahrain.png`,
  wec_portimao:`${WECX}/portimao.png`,
  elms_barcelona:`${ELMX}/barcelone-elms-69b7eea1a8f91756807100.png`,
  elms_imola:`${ELMX}/imola-elms-69b7e4fd946a3863386444.png`,
  elms_lecastellet:`${ELMX}/le-castellet-elms-69b7ee7381c93214935018.png`,
  elms_portimao:`${ELMX}/portimao-elms-69b7ee93b89d9386719725.png`,
  elms_silverstone:`${ELMX}/silverstone-elms-69b7ee8a621d4505427669.png`,
  elms_spa:`${ELMX}/spa-elms-69b7e4df47d51724602485.png`,
  gtwce_barcelona:`${GTW}/Barcelona_GTWCE.png`,    gtwce_brandshatch:`${GTW}/BrandsHatch__GTWCE.png`,
  gtwce_lecastellet:`${GTW}/CircuitPaulRicard_GTWCE.jpg`,gtwce_magnycours:`${GTW}/MagnyCours_GTWCE.png`,
  gtwce_misano:`${GTW}/Misano_GTWCE.png`,          gtwce_monza:`${GTW}/Monza_GTWCE.png`,
  gtwce_nurburgring:`${GTW}/Nurburgring_GTWCE.png`,gtwce_spa:`${GTW}/SPA__GTWCE.png`,
  gtwce_portimao:`${GTW}/Portimao_GTWCE.png`,      gtwce_zandvoort:`${GTW}/Zandvoort_GTWCE.jpg`,
  imsa_daytona:`${IMS}/Daytona_International_Speedway_Road_Course_2024.svg.png`,
  imsa_indianapolis:`${IMS}/Indianapolis_Motor_Speedway_Grand_Prix_Road_Course_2024.svg.png`,
  imsa_lagunaseca:`${IMS}/Laguna_Seca.svg.png`,    imsa_longbeach:`${IMS}/Long_Beach_Street_Circuit_IndyCar.svg.png`,
  imsa_mosport:`${IMS}/Mosport-CTMP.svg.png`,      imsa_roadamerica:`${IMS}/Road_America.svg.png`,
  imsa_roadatlanta:`${IMS}/Road_Atlanta_track_map.svg.png`,imsa_sebring:`${IMS}/Sebring_International_Raceway.svg.png`,
  imsa_detroit:`${IMS}/TrackMap_Detroit-2023.png`,  imsa_vir:`${IMS}/Virginia_International_Raceway_-_Full_Course.svg.png`,
  imsa_watkinsglen:`${IMS}/Watkins_Glen_International_Long_Circuit_2024.svg.png`,
  wrc_montecarlo:`${WRC}/MonteCarlo.avif`, wrc_sweden:`${WRC}/Suede.avif`,
  wrc_kenya:`${WRC}/Kenya.avif`,           wrc_croatia:`${WRC}/Croatie.avif`,
  wrc_canarias:`${WRC}/Espagne.avif`,      wrc_portugal:`${WRC}/Portugal.avif`,
  wrc_japan:`${WRC}/Japon.avif`,           wrc_greece:`${WRC}/Grece.avif`,
  wrc_estonia:`${WRC}/Estonie.avif`,       wrc_finland:`${WRC}/Finlande.avif`,
  wrc_paraguay:`${WRC}/Paraguay.avif`,     wrc_chile:`${WRC}/Chili.avif`,
  wrc_italy:`${WRC}/Sardaigne.avif`,       wrc_saudi:`${WRC}/ArabieSaoudite.avif`,
};
