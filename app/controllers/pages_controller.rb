class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def index
    @page = PageFactory.create
    render :page
  end

  def new
    @page = PageFactory.create
    render :page
  end

  def edit
    @page = Page.find_by_gpid(params[:gpid])
    render :page
  end

  def save
    if params[:chunk][:id].present?
      @page = Page.find_by_gpid(params[:chunk][:gpid])
      @page.chunk.update(content: params[:chunk][:content])
    else
      @page = PageFactory.build_with_chunk(
        params[:chunk][:gpid],
        Chunk.new(content: params[:chunk][:content])
      )
      @page.save
    end
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end
end
