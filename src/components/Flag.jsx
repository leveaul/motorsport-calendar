import { COUNTRY_CODES } from '../config';

export default function Flag({ country, size = 20 }) {
  const code = COUNTRY_CODES[country];
  if (!code) return null;
  return (
    <img
      src={`https://flagcdn.com/w${size * 2}/${code}.png`}
      alt={country}
      style={{ width: size * 1.4, height: size, objectFit: "cover", borderRadius: 2, display: "block" }}
      onError={e => e.target.style.display = "none"}
    />
  );
}
