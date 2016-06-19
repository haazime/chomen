class ChunkList extends React.Component {
  renderChunkBox(chunk) {
    return <ChunkBox key={chunk.gcid} {...chunk} />
  }

  render() {
    return (
      <div>
        {this.props.chunks.map(c => this.renderChunkBox(c))}
      </div>
    )
  }
}
