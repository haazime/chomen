class ChunkInputController extends React.Component {
  buildPayload(content) {
    const { gpid, gcid } = this.props
    return {
      gpid: gpid,
      gcid: gcid,
      content: content
    }
  }

  saveContent(content) {
    const { saveUrl, onModeChange } = this.props
    $.ajax({
      type: 'POST',
      url: saveUrl,
      data: this.buildPayload(content),
      beforeSend: () => { onModeChange('saving') },
      success: () => { onModeChange('idle') }
    })
  }

  render() {
    const { content, saveDelay } = this.props
    return (
      <ChunkInput
        content={content}
        saveDelay={saveDelay}
        onSave={this.saveContent.bind(this)}
      />
    )
  }
}
