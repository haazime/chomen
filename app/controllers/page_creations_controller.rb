class PageCreationsController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def new
    @form = PageCreationForm.new
  end

  def create
    creation = PageCreationForm.new(params[:page_creation])
    creation.run
    @form = ChunkEditingForm.from_chunk(creation.chunk)
  end

  private

    def set_pages
      @pages = Page.all
    end
end
