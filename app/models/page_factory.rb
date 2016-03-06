class PageFactory

  def self.new_page
    new.new_page
  end

  def initialize(gpid_generator = Generators::GPID)
    @gpid_generator = gpid_generator
  end

  def new_page
    gpid = @gpid_generator.generate
    chunk = Chunk.new(number: 1)
    build_with_chunk(gpid, chunk)
  end

  private

    def build_with_chunk(gpid, chunk)
      Page.new(gpid: gpid) do |page|
        page.chunks << chunk
      end
    end
end
