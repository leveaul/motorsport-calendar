export default function Spinner({ color }) {
  return (
    <div style={{ display: "flex", justifyContent: "center", padding: "40px 0" }}>
      <div style={{
        width: 35, height: 35, borderRadius: "50%",
        border: `3px solid ${color}30`,
        borderTop: `3px solid ${color}`,
        animation: "spin .7s linear infinite"
      }} />
    </div>
  );
}
