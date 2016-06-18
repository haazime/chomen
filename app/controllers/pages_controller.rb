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
    render :save, locals: { chunk: result.chunk }
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end

    def require_page
      render_404 unless page
    end

    def page(gpid = params[:gpid])
      @__page ||= Page.find_by_gpid(gpid)
    end
end
