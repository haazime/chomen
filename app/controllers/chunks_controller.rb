class ChunksController < ApplicationController

  def new
    base_chunk = Chunk.find_by_gcid(params[:base_gcid])
    @chunk = PageFactory.new_chunk(base_chunk.gpid)
  end

  def destroy
    chunk = Chunk.find(params[:id])
    chunk.page.destroy
    redirect_to root_url
  end
end
