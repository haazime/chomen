const ChunkBox = (props) => {
  const {
    content,
    linkTitle,
    mode,
    sortUrl,
    destroyUrl
  } = props

  const chunkBody = () => {
    if (linkTitle) {
      return <ChunkLink title={linkTitle} url={content} />
    } else {
      return <ChunkInputController {...props} />
    }
  }()

  return (
    <div
      className='chunk-box sortable-item'
      data-sort-url={sortUrl}
    >
      <ChunkHandle />
      {chunkBody}
      <ChunkIndicator
        mode={mode}
        destroyUrl={destroyUrl}
      />
    </div>
  )
}
