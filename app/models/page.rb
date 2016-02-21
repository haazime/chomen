class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self
    def sorted_by_update
      all.order(updated_at: :desc)
    end
  end

  def label
    @label ||= chunks.first.label
  end
end
