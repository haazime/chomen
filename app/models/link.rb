class Link < ActiveRecord::Base
  class << self
    attr_writer :title_extractor

    def title(content)
      return unless url?(content)
      title_extractor.extract(content)
    end

    private

      def url?(content)
        return false if /\s/.match(content)
        URI.regexp.match(content)
      end

      def title_extractor
        @title_extractor || TitleExtractor
      end
  end
end
