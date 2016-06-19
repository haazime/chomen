class ChunkIndicator extends React.Component {
  render() {
    const style = {display: 'none'}
    return (
      <span style={style} className='chunk-indicator'>
        <i className='fa fa-cloud-upload' /> Saved
      </span>
    )
  }
}
