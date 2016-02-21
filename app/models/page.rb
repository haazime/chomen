require 'securerandom'

class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  class << self

    def self.new_with_chunk(chunk)
      new(gpid: SecureRandom.uuid).tap do |page|
        page.chunks << chunk
      end
    end

    def sorted_by_update
      all.order(updated_at: :desc)
    end
  end

  def label
    @label ||= chunks.first.label
  end
end
