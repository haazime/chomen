class Chunk < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  belongs_to :page

  validates :content, presence: true

  delegate :gpid, to: :page

  before_update do
    page.update!(updated_at: Time.current)
  end

  before_destroy do
    page.update!(updated_at: Time.current)
  end

  def destroy_with_page
    page.destroy_from_chunk(id)
  end

  def label
    @label ||= content.split(/\n\r|\r|\n/).first
  end
end
