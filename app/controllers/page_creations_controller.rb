class PageCreationsController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def new
    @form = PageCreation.new
  end

  def create
    creation = PageCreation.new(params[:page_creation])
    creation.run
    @form = ChunkEditing.from_chunk(creation.chunk)
  end

  private

    def set_pages
      @pages = Page.all
    end
end