require 'securerandom'

module PageFactory
  class << self

    def create(gpid_generator = GpidGenerator)
      Page.new(gpid: gpid_generator.generate).tap do |page|
        page.chunks.build
      end
    end

    def build_from_chunk(chunk_params)
      Page.new(gpid: chunk_params[:gpid]).tap do |page|
        page.chunks.build(content: chunk_params[:content])
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
