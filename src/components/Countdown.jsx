import { useCountdown } from '../hooks';

export default function Countdown({ targetIso, color = "#fff", size = 1 }) {
  const diff = useCountdown(targetIso);
  if (!diff) return null;
  const pad = n => String(n).padStart(2, '0');
  const base = { fontWeight: 900, fontFamily: "'Barlow Condensed',sans-serif", lineHeight: 1, color };
  if (diff.d > 0) return (
    <div style={{ ...base, fontSize: 28 * size }}>
      {diff.d}<span style={{ fontSize: 12 * size, opacity: .6 }}>j </span>
      {pad(diff.h)}<span style={{ fontSize: 12 * size, opacity: .6 }}>h </span>
      {pad(diff.m)}<span style={{ fontSize: 12 * size, opacity: .6 }}>m</span>
    </div>
  );
  return (
    <div style={{ ...base, fontSize: 32 * size }}>
      {pad(diff.h)}<span style={{ fontSize: 12 * size, opacity: .7 }}>:</span>
      {pad(diff.m)}<span style={{ fontSize: 12 * size, opacity: .7 }}>:</span>
      {pad(diff.s)}
    </div>
  );
}
