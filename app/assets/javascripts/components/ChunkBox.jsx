class ChunkBox extends React.Component {
  constructor(props) {
    super(props)
    this.state = { mode: 'idle' }
  }

  changeModeTo(mode) {
    this.setState({ mode: mode })
  }

  saveContent(content) {
    const { gpid, gcid, saveUrl } = this.props
    const data = {
      gpid: gpid,
      gcid: gcid,
      content: content
    }
    $.ajax({
      type: 'POST',
      url: saveUrl,
      data: data,
      beforeSend: () => { this.changeModeTo('saving') },
      success: () => { this.changeModeTo('idle') }
    })
  }

  render() {
    const {
      content,
      saveDelay,
      destroyUrl,
      sortUrl
    } = this.props

    return (
      <div
        className='chunk-box sortable-item'
        data-sort-url={sortUrl}
      >
        <ChunkHandle />
        <ChunkInput
          content={content}
          saveDelay={saveDelay}
          onSave={this.saveContent.bind(this)}
        />
        <ChunkIndicator
          mode={this.state.mode}
          destroyUrl={destroyUrl}
        />
      </div>
    )
  }
}
