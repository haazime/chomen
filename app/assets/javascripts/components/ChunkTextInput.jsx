class ChunkTextInput extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      value: this.props.content,
      timeoutId: null,
    }
  }

  handleChange(e) {
    this.setState({ value: e.target.value })
    this.saveContent()
  }

  saveContent() {
    if (this.state.timeoutId) {
      clearTimeout(this.state.timeoutId)
    }
    const timeoutId = setTimeout(() => {
      console.log('save!', this.state.value)
    }, 2000)
    this.setState({ timeoutId: timeoutId })
  }

  render() {
    const value = this.state.value

    return (
      <textarea
        className='form-control content'
        value={value}
        onChange={this.handleChange.bind(this)}
      />
    )
  }
}
