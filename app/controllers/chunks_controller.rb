class ChunksController < ApplicationController

  def destroy
    chunk = Chunk.find(params[:id])
    chunk.page.destroy
    redirect_to root_url
  end
end
