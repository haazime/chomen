require 'securerandom'

class Page < ActiveRecord::Base
  has_many :chunks, dependent: :destroy

  before_create do
    self.gpid = SecureRandom.uuid
  end

  def label
    @label ||= chunks.first.label
  end
end
