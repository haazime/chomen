class ChunkRemover extends React.Component {
  render() {
    return (
      <a
        href={this.props.url}
        data-method='delete'
        data-confirm='*DELETE this chunk* Are you sure?'
        className='chunk-remover'
      >
        <i className='fa fa-circle-thin' />
      </a>
    )
  }
}
