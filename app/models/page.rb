require 'securerandom'

class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  def self.create_with_chunk(chunk)
    new(gpid: SecureRandom.uuid).tap do |page|
      page.chunks << chunk
    end
  end

  def label
    @label ||= chunks.first.label
  end
end
