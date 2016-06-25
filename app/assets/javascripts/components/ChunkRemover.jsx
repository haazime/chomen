const ChunkRemover = ({ url }) => {
  return (
    <a
      href={url}
      data-method='delete'
      data-sweet-confirm='*DELETE this chunk* Are you sure?'
      className='chunk-remover'
    >
      <i className='fa fa-minus-circle chunk-icon chunk-icon-danger' />
    </a>
  )
}
