class ChunkBox extends React.Component {
  render() {
    const { content } = this.props

    return (
      <div className='chunk-segment'>
        <ChunkTextInput content={content} />
      </div>
    )
  }
}
