class ChunksController < ApplicationController

  def new
    @page = Page.find_or_initialize_by(gpid: params[:gpid])
    @page.add_new_chunk
  end

  def destroy
    if chunk = Chunk.find_by(gcid: params[:gcid])
      chunk.destroy_with_page
    end
    redirect_to root_url
  end

  def sort
    chunk = Chunk.find_by(gcid: params[:gcid])
    chunk.update(row_order_position: params[:pos])
    render nothing: true
  end
end
