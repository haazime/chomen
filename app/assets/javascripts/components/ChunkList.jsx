class ChunkList extends React.Component {
  renderChunkBox(chunk) {
    return (
      <ChunkModeController
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
