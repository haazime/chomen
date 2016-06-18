class ChunkBox extends React.Component {
  render() {
    const { gpid, gcid, content, url } = this.props

    const onSave = (content) => {
      const data = {
        gpid: gpid || '',
        gcid: gcid,
        content: content
      }
      $.ajax({ type: 'POST', url: url, data: data })
    }

    return (
      <div className='chunk-segment'>
        <ChunkTextInput
          gpid={gpid}
          gcid={gcid}
          content={content}
          onSave={onSave}
        />
      </div>
    )
  }
}
