const ChunkLink = ({ url }) => {
  return (
    <a
      href={url}
      className='chunk-link'
      target='_blank'
    >
      <span>
        <i className='fa fa-external-link-square chunk-icon chunk-icon-success' />
      </span>
    </a>
  )
}
