require 'securerandom'

module PageFactory
  module_function

  def create(chunk)
    Page.new(gpid: SecureRandom.uuid).tap do |page|
      page.chunks << chunk
    end
  end
end
