class ChunkList extends React.Component {
  renderChunkBox(active, chunk) {
    const isActive = active === chunk.gcid
    return (
      <ChunkBox
        key={chunk.gcid}
        isActive={isActive}
        {...chunk}
      />
    )
  }

  render() {
    const { active, chunks } = this.props
    return (
      <div>
        {chunks.map(c => this.renderChunkBox(active, c))}
      </div>
    )
  }
}
