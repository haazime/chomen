require 'metainspector'

module TitleExtractor
  module_function

  def extract(url)
    page = MetaInspector.new(url)
    page.title
  end
end
