class ChunkTextInput extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      value: this.props.content || '',
      timeoutId: undefined,
    }
  }

  componentDidMount() {
    ReactDOM.findDOMNode(this.refs.textarea).focus()
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
      this.props.onSave(this.state.value)
    }, 2000)

    this.setState({ timeoutId: timeoutId })
  }

  render() {
    const value = this.state.value
    const rows = value.split("\n").length
    return (
      <textarea
        ref='textarea'
        className='form-control'
        rows={rows}
        value={value}
        onChange={this.handleChange.bind(this)}
      />
    )
  }
}
