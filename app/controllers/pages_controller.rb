class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def index
    @page = PageFactory.create
    render :page
  end

  def new
    @page = PageFactory.create
    render :page
  end

  def edit
    @page = Page.find_by_gpid(params[:gpid])
    render :page
  end

  def save
    command = SavePageCommands.detect(params[:chunk])
    @page = command.run
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end
end
