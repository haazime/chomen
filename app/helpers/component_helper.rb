module ComponentHelper

  def chunk_list_attributes(page, focused = nil)
    chunks = page.ordered_chunks
    {
      active: (focused || chunks.last).gcid,
      chunks: chunks.map { |c| chunk_attributes(c) }
    }
  end

  def chunk_attributes(chunk)
    chunk.attributes.merge(
      gpid: chunk.gpid,
      save_url: pages_url,
      save_delay: Rails.env == 'test' ? 1 : 5000,
      destroy_url: chunk.persisted? ? chunk_url(chunk) : nil
    )
  end

  def chunk_list_component_props(chunks)
    {
      active: chunks.max_by(&:updated_at).gcid,
      chunks: chunks.map { |c| chunk_component_props(c) }
    }
  end

  def chunk_component_props(chunk)
    chunk.attributes.merge(
      gpid: chunk.gpid,
      save_url: pages_url,
      save_delay: Rails.env == 'test' ? 1 : 2500,
      destroy_url: chunk.persisted? ? chunk_url(chunk) : nil
    )
  end
end
