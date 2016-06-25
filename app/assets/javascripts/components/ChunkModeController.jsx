class ChunkModeController extends React.Component {
  constructor(props) {
    super(props)
    this.state = { mode: 'idle' }
  }

  handleModeChange(mode) {
    this.setState({ mode: mode })
  }

  render() {
    return (
      <ChunkBox
        {...this.props}
        mode={this.state.mode}
        onModeChange={this.handleModeChange.bind(this)}
      />
    )
  }
}
