module ComponentHelper
  def chunk_component_props(chunk)
    chunk.attributes.merge(
      gpid: chunk.gpid,
      save_url: pages_url,
      save_delay: Rails.env == 'test' ? 1 : 2500,
      destroy_url: chunk.persisted? ? chunk_url(chunk) : nil
    )
  end
end
