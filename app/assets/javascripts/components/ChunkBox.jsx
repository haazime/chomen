class ChunkBox extends React.Component {
  saveContent(content) {
    const { gpid, gcid, saveUrl } = this.props
    const data = {
      gpid: gpid || '',
      gcid: gcid,
      content: content
    }
    $.ajax({ type: 'POST', url: saveUrl, data: data })
  }

  render() {
    const {
      isActive,
      gcid,
      content,
      saveDelay,
      destroyUrl
    } = this.props

    return (
      <div id={gcid} className='chunk-box'>
        <ChunkActions destroyUrl={destroyUrl} />
        <ChunkTextInput
          isActive={isActive}
          content={content}
          saveDelay={saveDelay}
          onSave={this.saveContent.bind(this)}
        />
      </div>
    )
  }
}
