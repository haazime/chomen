class ChunkRemover extends React.Component {
  renderLink(url) {
    return (
      <a
        href={url}
        data-method='delete'
        data-confirm='*DELETE this chunk* Are you sure?'
        className='chunk-remover'
      >
        <i className='fa fa-minus-circle' />
      </a>
    )
  }

  renderPoint() {
    return <span><i className='fa fa-circle-thin chunk-point' /></span>
  }

  render() {
    const { url } = this.props
    if (url) {
      return this.renderLink(url)
    } else {
      return this.renderPoint()
    }
  }
}
