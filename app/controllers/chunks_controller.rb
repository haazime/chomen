class ChunksController < ApplicationController

  def new
    page = Page.find_by_gpid(params[:gpid])
    @chunk = page.chunks.build
  end

  def destroy
    chunk = Chunk.find(params[:id])
    chunk.destroy_with_page
    redirect_to root_url
  end
end
