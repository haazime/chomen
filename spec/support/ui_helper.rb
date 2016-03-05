module UIHelper

  def chunk_segment(num)
    chunk_segments[num - 1]
  end

  def chunk_segments
    all('.chunk-segment')
  end

  def chunk_form(num)
    chunk_segment(num).first('form')
  end

  def delete_chunk_button
    first('.delete-chunk')
  end
end
