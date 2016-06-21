class ChunkBox extends React.Component {
  saveContent(content) {
    const { gpid, gcid, saveUrl } = this.props
    const data = {
      gpid: gpid,
      gcid: gcid,
      content: content
    }
    $.ajax({ type: 'POST', url: saveUrl, data: data })
  }

  render() {
    const { gcid, content, saveDelay, destroyUrl } = this.props

    return (
      <div id={gcid} className='chunk-box'>
        <ChunkActions destroyUrl={destroyUrl} />
        <ChunkInput
          content={content}
          saveDelay={saveDelay}
          onSave={this.saveContent.bind(this)}
        />
      </div>
    )
  }
}
