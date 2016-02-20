class ChunkEditing
  include ActiveModel::Model

  attr_accessor :content

  def self.from_chunk(chunk)
    new(content: chunk.content)
  end
end
