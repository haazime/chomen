class ChunkActions extends React.Component {
  render() {
    return (
      <div className='chunk-actions'>
        <ChunkRemover url={this.props.destroyUrl} />
        <ChunkIndicator />
      </div>
    )
  }
}
