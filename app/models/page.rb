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
    @label ||= chunks.first.label
  end
end
