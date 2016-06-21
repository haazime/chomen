class ChunkList extends React.Component {
  renderChunkBox(chunk) {
    return (
      <ChunkBox
        key={chunk.gcid}
        {...chunk}
      />
    )
  }

  render() {
    const { chunks } = this.props
    return (
      <div className='sortable-list'>
        {chunks.map(c => this.renderChunkBox(c))}
      </div>
    )
  }
}
