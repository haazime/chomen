class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def new
    @page = PageFactory.create
    render :page
  end

  def save
    @page = PageFactory.build_with_chunk(
      params[:chunk][:gpid],
      Chunk.new(content: params[:chunk][:content])
    )
    @page.save
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end
end
