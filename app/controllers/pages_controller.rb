class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def index
    @page = PageFactory.new_page
    @chunks = @page.chunks
    render :page
  end

  def new
    @page = PageFactory.new_page
    @chunks = @page.chunks
    render :page
  end

  def edit
    @page = Page.find_by_gpid(params[:gpid])
    @chunks = @page.ordered_chunks
    render :page
  end

  def save
    command = SavePageCommands.detect(params[:chunk])
    command.run
    command.render(self)
  end

  def render_for_create_page(result)
    render :create, locals: { chunk: result.chunk }
  end

  def render_for_update_chunk(result)
    render :update, locals: { chunk: result.chunk }
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end
end
