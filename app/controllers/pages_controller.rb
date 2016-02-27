class PagesController < ApplicationController
  before_action :authorize!
  before_action :set_pages

  def new
    @page = PageFactory.create
    render :page
  end

  def save
    @page = PageFactory.build_from_chunk(params[:chunk])
    @page.save
  end

  private

    def set_pages
      @pages = Page.sorted_by_update
    end
end
