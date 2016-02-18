require 'securerandom'

class Page < ActiveRecord::Base
  validates :content, presence: true

  before_create do
    self.gpid = SecureRandom.uuid
  end

  def label
    @label ||= content.split(/\n\r|\r|\n/).first
  end
end
