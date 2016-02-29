require 'securerandom'

class PageFactory
  class << self
  end

  def initialize(gpid_generator = GPIDGenerator, gcid_generator = GCIDGenerator)
    @gpid_generator = gpid_generator
    @gcid_generator = gcid_generator
  end

  def new_page
    gpid = @gpid_generator.generate
    gcid = @gcid_generator.generate
    chunk = Chunk.new(gcid: gcid)
    build_with_chunk(gpid, chunk)
  end

  def create_page(gpid, gcid, content)
    chunk = Chunk.new(gcid: gcid, content: content)
    build_with_chunk(gpid, chunk)
  end

  private

    def build_with_chunk(gpid, chunk)
      Page.new(gpid: gpid) do |page|
        page.chunks << chunk
      end
    end
end

module GPIDGenerator
  module_function

  def generate
    "pg-#{SecureRandom.uuid}"
  end
end

module GCIDGenerator
  module_function

  def generate
    "ch-#{SecureRandom.uuid}"
  end
end
