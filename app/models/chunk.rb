class Chunk < ActiveRecord::Base
  belongs_to :page

  validates :content, presence: true

  delegate :gpid, to: :page

  def label
    @label ||= content.split(/\n\r|\r|\n/).first
  end
end
