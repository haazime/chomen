class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def new
    @chunk = Chunk.new
    render :page
  end

  def edit
    page = Page.find_by_gpid(params[:gpid])
    @chunk = page.chunks.first
    render :page
  end

  def update
    if @page.update(page_params)
      render
    else
      render :page
    end
  end

  private

    def page_params
      params.require(:page).permit(:content)
    end

    def set_pages
      @pages = Page.all
    end
end
