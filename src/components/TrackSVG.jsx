import { useState, useEffect } from "react";
import { getTrackKey } from '../utils';
import { TRACK_IMAGES } from '../config';

export default function TrackSVG({ circuit, color, size = 140, seriesId = '', circuitKey = null }) {
  const key = getTrackKey(circuit, seriesId, circuitKey);
  const imgUrl = key ? TRACK_IMAGES[key] : null;
  const [error, setError] = useState(false);
  useEffect(() => { setError(false); }, [circuit]);

  if (!imgUrl || error) return (
    <div style={{ width: "100%", height: "100%", display: "flex", alignItems: "center", justifyContent: "center" }}>
      <div style={{ fontSize: 12, color: "#CCC", textAlign: "center" }}>{circuit || "Circuit"}</div>
    </div>
  );
  return (
    <div style={{ width: "100%", height: "100%", display: "flex", alignItems: "center", justifyContent: "center" }}>
      <img src={imgUrl} alt={circuit} onError={() => setError(true)}
        style={{ width: "100%", height: "100%", objectFit: "contain", display: "block" }} />
    </div>
  );
}
