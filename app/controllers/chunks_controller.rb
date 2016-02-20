class ChunksController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def create
    @chunk = Chunk.new(chunk_params)
    page = Page.new
    page.chunks << @chunk
    page.save
  end

  private

    def chunk_params
      params.require(:chunk).permit(:page_id, :content)
    end

    def set_pages
      @pages = Page.all
    end
end
