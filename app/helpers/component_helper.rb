module ComponentHelper
  def chunk_component_props(chunk)
    chunk.attributes.merge(
      gpid: chunk.gpid,
      url: pages_url,
      is_saved: chunk.persisted?
    )
  end
end
