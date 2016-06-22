class ChunkBox extends React.Component {
  constructor(props) {
    super(props)
    this.state = { mode: 'idle' }
  }

  handleModeChange(mode) {
    this.setState({ mode: mode })
  }

  render() {
    const { content, isLink, sortUrl, destroyUrl } = this.props
    return (
      <div
        className='chunk-box sortable-item'
        data-sort-url={sortUrl}
      >
        <ChunkHandle />
        <ChunkInputController
          {...this.props}
          onModeChange={this.handleModeChange.bind(this)}
        />
        {isLink ? <ChunkLink url={content} /> : ''}
        <ChunkIndicator
          mode={this.state.mode}
          destroyUrl={destroyUrl}
        />
      </div>
    )
  }
}
