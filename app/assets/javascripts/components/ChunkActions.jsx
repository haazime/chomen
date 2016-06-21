class ChunkActions extends React.Component {
  render() {
    return (
      <div className='chunk-actions'>
        <ChunkHandle />
        <ChunkIndicator />
        <ChunkRemover url={this.props.destroyUrl} />
      </div>
    )
  }
}
