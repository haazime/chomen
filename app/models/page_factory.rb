require 'securerandom'

module PageFactory
  class << self

    def new_page
      build_with_chunk(nil, Chunk.new)
    end

    def create(chunk, gpid_generator = GpidGenerator)
      gpid = gpid_generator.generate
      build_with_chunk(gpid, chunk)
    end

    private

      def build_with_chunk(gpid, chunk)
        Page.new(gpid: gpid) do |page|
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
