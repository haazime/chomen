const ChunkLink = ({ title, url }) => {
  return (
    <a
      href={url}
      className='chunk-link'
      target='_blank'
    >
      {title}
      <i className='fa fa-external-link-square chunk-icon chunk-icon-success' />
    </a>
  )
}
