class PageFactory

  def self.new_page
    new.new_page
  end

  def initialize(gpid_generator = Generators::GPID)
    @gpid_generator = gpid_generator
  end

  def new_page
    Page.new(gpid: @gpid_generator.generate) do |page|
      page.add_new_chunk
    end
  end
end
