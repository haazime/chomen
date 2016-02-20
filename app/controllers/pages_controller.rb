class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages
  before_action :set_page, only: [:edit, :update]

  def new
    @form = NewPageForm.new
    render :page
  end

  def edit
    render :page
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      render
    else
      render :page
    end
  end

  def update
    if @page.update(page_params)
      render
    else
      render :page
    end
  end

  private

    def page_params
      params.require(:page).permit(:content)
    end

    def set_pages
      @pages = Page.all
    end

    def set_page
      @page = Page.find_by(gpid: params[:gpid])
    end
end
