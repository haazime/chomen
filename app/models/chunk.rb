class Chunk < ActiveRecord::Base
  include RankedModel

  belongs_to :page
  ranks :row_order, with_same: :page_id

  has_one :link, dependent: :destroy

  validates :content, presence: true

  delegate :gpid, to: :page
  delegate :title, to: :link, prefix: true, allow_nil: true

  after_save do
    if title = Link.title(content)
      create_link!(title: title)
    end
  end

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
