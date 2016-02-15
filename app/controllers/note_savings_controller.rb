class NoteSavingsController < ApplicationController

  def new
    @form = NoteSaving.new
    @titles = %w(alpha brabo charlie delta echo foxtrot golf hotel)
  end

  def create
  end
end
