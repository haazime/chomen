class ChunksController < ApplicationController

  def new
    page = Page.find_or_initialize_by(gpid: params[:gpid])
    @chunk = page.add_new_chunk
  end

  def destroy
    chunk = Chunk.find(params[:id])
    chunk.destroy_with_page
    redirect_to root_url
  end
end
