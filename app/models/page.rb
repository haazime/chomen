class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self

    def sorted_by_update
      includes(:chunks).order(updated_at: :desc)
    end
  end

  def add_chunk(content, gcid_generator = Generators::GCID)
    gcid = gcid_generator.generate
    self.chunks.build(gcid: gcid, content: content)
  end

  def chunk
    chunks.first
  end

  def label
    @label ||= chunks.first.label
  end
end
