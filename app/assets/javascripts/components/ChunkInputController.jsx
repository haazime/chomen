class ChunkInputController extends React.Component {
  constructor(props) {
    super(props)
    this.state = { timeoutId: undefined }
  }

  handleChange(content) {
    if (this.state.timeoutId) {
      clearTimeout(this.state.timeoutId)
    }

    const timeoutId = setTimeout(() => {
      this.saveContent(content)
    }, this.props.saveDelay)

    this.setState({ timeoutId: timeoutId })
  }

  saveContent(content) {
    const { saveUrl, onModeChange } = this.props
    $.ajax({
      type: 'POST',
      url: saveUrl,
      data: this.buildPayload(content),
      beforeSend: () => { onModeChange('saving') },
      success: () => { onModeChange('idle') },
      error: () => { onModeChange('failed') }
    })
  }

  buildPayload(content) {
    const { gpid, gcid } = this.props
    return {
      gpid: gpid,
      gcid: gcid,
      content: content
    }
  }

  render() {
    const { content } = this.props

    return (
      <ChunkInput
        content={content}
        onChange={this.handleChange.bind(this)}
      />
    )
  }
}
