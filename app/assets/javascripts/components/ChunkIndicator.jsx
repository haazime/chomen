class ChunkIndicator extends React.Component {
  createChild() {
    const { mode, destroyUrl } = this.props
    switch(mode) {
      case 'saving':
        return <ChunkSpinner />
      default:
        return <ChunkRemover url={destroyUrl} />
    }
  }

  render() {
    return (
      <div className='chunk-indicator'>
        {this.createChild()}
      </div>
    )
  }
}
