class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self

    def last_updated
      includes(:chunks).order('chunks.updated_at DESC').limit(1).first
    end

    def sorted_by_update
      includes(:chunks).order(updated_at: :desc)
    end
  end

  def add_chunk(chunk, gcid_generator: Generators::GCID)
    chunk.gcid = gcid_generator.generate
    self.chunks << chunk
  end

  def destroy_from_chunk(chunk_id)
    if chunks(true).many?
      chunks.destroy(chunk_id)
    else
      destroy
    end
  end

  def label
    @label ||= chunk(1).label
  end

  def chunk(number)
    ordered_chunks[number - 1]
  end

  def ordered_chunks
    return chunks unless persisted?
    chunks.order(:number)
  end
end
