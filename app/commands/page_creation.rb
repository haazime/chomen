class PageCreation
  include ActiveModel::Model

  attr_accessor :content

  def run
    @page = Page.new do |p|
      p.chunks.build(content: content)
    end
    @page.save
  end

  def chunk
    @page.chunks.first
  end
end
