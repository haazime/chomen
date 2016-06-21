class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self

    def last_updated
      sorted_by_update.limit(1).first
    end

    def sorted_by_update
      order(updated_at: :desc)
    end
  end

  def add_new_chunk(gcid_generator = Generators::GCID)
    add_chunk(gcid_generator.generate, nil)
  end

  def add_chunk(gcid, content)
    self.chunks.build(
      gcid: gcid,
      content: content,
      created_at: Time.current
    )
  end

  def destroy_from_chunk(chunk_id)
    if chunks(true).many?
      chunks.destroy(chunk_id)
    else
      destroy
    end
  end

  def label
    @label ||= ordered_chunks.first&.label
  end

  def ordered_chunks
    return chunks unless persisted?

    sorter = ->(chunks) { chunks.rank(:row_order) }
    return sorter.call(chunks) if chunks.all?(&:persisted?)

    persisteds, new = chunks.partition(&:persisted?)
    return sorter.call(chunks) + new
  end
end
