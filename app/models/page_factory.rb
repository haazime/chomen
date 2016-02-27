require 'securerandom'

module PageFactory
  class << self

    def create(gpid_generator = GpidGenerator)
      gpid = gpid_generator.generate
      chunk = Chunk.new
      build_with_chunk(gpid, chunk)
    end

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
