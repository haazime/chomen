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
    <ChunkBoxContainer mode={mode} sortUrl={sortUrl}>
      <ChunkHandle />
      {chunkBody}
      <ChunkIndicator
        mode={mode}
        destroyUrl={destroyUrl}
      />
    </ChunkBoxContainer>
  )
}
