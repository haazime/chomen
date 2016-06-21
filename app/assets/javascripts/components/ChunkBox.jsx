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
    const {
      gcid,
      content,
      saveDelay,
      destroyUrl,
      sortUrl
    } = this.props

    return (
      <div
        id={gcid}
        className='chunk-box sortable-item'
        data-sort-url={sortUrl}
      >
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
