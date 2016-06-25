class ChunkInput extends React.Component {
  constructor(props) {
    super(props)
    const content = this.props.content || ''
    this.state = { value: content }
  }

  componentDidMount() {
    ReactDOM.findDOMNode(this.refs.textarea).focus()
  }

  handleChange(e) {
    const { value } = e.target
    this.setState({ value: value })
    this.props.onChange(value)
  }

  render() {
    const { value } = this.state
    const rows = value.split("\n").length

    return (
      <div className='chunk-body'>
        <textarea
          ref='textarea'
          className='form-control'
          style={{fontSize: '1.7rem'}}
          rows={rows}
          value={value}
          onChange={this.handleChange.bind(this)}
        />
      </div>
    )
  }
}
