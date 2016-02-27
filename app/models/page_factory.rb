require 'securerandom'

module PageFactory
  module_function

  def create(gpid_generator = GpidGenerator)
    Page.new(gpid: gpid_generator.generate).tap do |page|
      page.chunks.build
    end
  end
end

module PageFactory
  module GpidGenerator
    module_function

    def generate
      SecureRandom.uuid
    end
  end
end
