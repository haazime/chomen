class ChunksController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def create
    @chunk = Chunk.new(chunk_params)
    PageFactory.create(@chunk).save
  end

  def update
    @chunk = Chunk.find(params[:id])
    @chunk.update(chunk_params)
  end

  private

    def chunk_params
      params.require(:chunk).permit(:page_id, :content)
    end

    def set_pages
      @pages = Page.sorted_by_update
    end
end
