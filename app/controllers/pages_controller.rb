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

  private

    def set_pages
      @pages = Page.all
    end
end
