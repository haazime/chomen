require 'securerandom'

module PageFactory
  class << self

    def create(gpid_generator = GpidGenerator)
      Page.new(gpid: gpid_generator.generate).tap do |page|
        page.chunks.build
      end
    end

    def build_with_chunk(gpid, chunk)
      Page.new(gpid: gpid).tap do |page|
        page.chunks << chunk
      end
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
