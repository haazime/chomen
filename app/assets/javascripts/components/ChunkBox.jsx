class ChunkBox extends React.Component {
  constructor(props) {
    super(props)
    this.state = { mode: 'idle' }
  }

  handleModeChange(mode) {
    this.setState({ mode: mode })
  }

  render() {
    const { content, linkTitle, sortUrl, destroyUrl } = this.props
    const chunkBody = () => {
      if (linkTitle) {
        return <ChunkLink title={linkTitle} url={content} />
      }
        return (
          <ChunkInputController
            {...this.props}
            onModeChange={this.handleModeChange.bind(this)}
          />
        )
    }()

    return (
      <div
        className='chunk-box sortable-item'
        data-sort-url={sortUrl}
      >
        <ChunkHandle />
        {chunkBody}
        <ChunkIndicator
          mode={this.state.mode}
          destroyUrl={destroyUrl}
        />
      </div>
    )
  }
}
