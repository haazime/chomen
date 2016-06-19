module ComponentHelper
  def chunk_component_props(chunk)
    chunk.attributes.merge(
      gpid: chunk.gpid,
      url: pages_url,
      is_saved: chunk.persisted?,
      save_delay: Rails.env == 'test' ? 1 : 2500
    )
  end
end
