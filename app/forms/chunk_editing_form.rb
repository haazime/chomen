class ChunkEditingForm
  include ActiveModel::Model

  attr_accessor :chunk_id, :content

  def self.from_chunk(chunk)
    new(content: chunk.content)
  end
end
