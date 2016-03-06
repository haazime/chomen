class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self

    def sorted_by_update
      includes(:chunks).order(updated_at: :desc)
    end
  end

  def add_chunk(chunk, gcid_generator: Generators::GCID)
    chunk.gcid = gcid_generator.generate
    self.chunks << chunk
  end

  def label
    @label ||= chunk(1).label
  end

  def chunk(number)
    ordered_chunks[number - 1]
  end

  def ordered_chunks
    chunks.order(:number)
  end
end
