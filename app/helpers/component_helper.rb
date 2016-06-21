module ComponentHelper

  def chunk_list_attributes(page)
    chunks = page.ordered_chunks.map { |c| chunk_attributes(page, c) }
    { chunks: chunks }
  end

  def chunk_attributes(page, chunk)
    chunk.attributes.merge(
      gpid: page.gpid,
      save_url: pages_url,
      destroy_url: destroy_chunk_url(gcid: chunk.gcid),
      save_delay: save_delay
    )
  end

  def save_delay
    @save_delay ||= Rails.env == 'test' ? 1 : 3000
  end
end
