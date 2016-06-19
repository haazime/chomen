module UIHelper
  def chunk_input(i)
    all('textarea')[i]
  end

  def chunk_segment(num)
    chunk_segments[num - 1]
  end

  def chunk_form(num)
    all('form')[num - 1]
  end

  def chunk_content(num)
    all('textarea.content')[num - 1]&.text
  end

  def delete_chunk_button(num)
    all('.delete-chunk')[num - 1]
  end

  def chunk_segments
    all('.chunk-segment')
  end
end
