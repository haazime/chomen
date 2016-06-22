class ChunkActions extends React.Component {
  render() {
    const { mode, destroyUrl } = this.props
    return (
      <div className='chunk-actions'>
        <ChunkHandle />
        <ChunkIndicator
          mode={mode}
          destroyUrl={destroyUrl}
        />
      </div>
    )
  }
}
