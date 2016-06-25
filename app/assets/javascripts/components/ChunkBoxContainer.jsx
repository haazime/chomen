const ChunkBoxContainer = ({ mode, sortUrl, children }) => {
  return (
    <div
      className={`chunk-box sortable-item ${mode}`}
      data-sort-url={sortUrl}
    >
      {children}
    </div>
  )
}
