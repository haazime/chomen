class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages
  before_action :require_page, only: [:edit]

  def index
    @page = Page.last_updated || PageFactory.new_page
    render :page
  end

  def new
    @page = PageFactory.new_page
    render :page
  end

  def edit
    @page = page
    render :page
  end

  def save
    command = SavePageCommands.detect(params)
    command.run
    command.render(self)
  end

  def render_for_save(result)
    @chunk = result.chunk
    @page = @chunk.page
    render :save
  end

  private

    def page(gpid = params[:gpid])
      @__page ||= Page.find_by_gpid(gpid)
    end
end
