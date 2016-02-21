class Chunk < ActiveRecord::Base
  validates :content, presence: true

  def label
    @label ||= content.split(/\n\r|\r|\n/).first
  end
end
