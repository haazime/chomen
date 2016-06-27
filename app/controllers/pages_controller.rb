class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_recent_pages
  before_action :require_page, only: [:edit]

  def index
    @pages = Page.list.page(params[:page]).per(15)
  end

  def show
    @page = Page.last_updated || PageFactory.new_page
    render :page
  end

  def new
    @page = PageFactory.new_page
    render :page
  end

  def edit
    @page = page
    page.touch
    render :page
  end

  def save
    command = SavePageCommands.detect(params)
    command.run
    command.render(self)
  end

  def render_for_save(result)
    @chunk = result.chunk
    render :save
  end

  def destroy
    page.destroy
    redirect_to pages_url
  end

  private

    def page(gpid = params[:gpid])
      @__page ||= Page.find_by_gpid(gpid)
    end
end
