class ChunkBox extends React.Component {
  saveContent(content) {
    const { gpid, gcid, url } = this.props
    const data = {
      gpid: gpid || '',
      gcid: gcid,
      content: content
    }
    $.ajax({ type: 'POST', url: url, data: data })
  }

  render() {
    return (
      <div>
        <ChunkActions isSaved={this.props.isSaved} />
        <ChunkTextInput
          content={this.props.content}
          onSave={this.saveContent.bind(this)}
        />
      </div>
    )
  }
}
