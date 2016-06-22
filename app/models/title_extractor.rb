require 'metainspector'

module TitleExtractor
  module_function

  def extract(url)
    page = MetaInspector.new(url, connection_timeout: 5, retries: 0)
    page.title
  rescue Faraday::TimeoutError
    nil
  end
end
