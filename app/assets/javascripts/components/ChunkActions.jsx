class ChunkActions extends React.Component {
  render() {
    if (this.props.isSaved) {
      return (
        <div className='chunk-actions'>
          <i className='fa fa-circle-thin' />
        </div>
      )
    } else {
      return <span />
    }
  }
}
