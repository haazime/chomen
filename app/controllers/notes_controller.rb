class NotesController < ApplicationController

  def new
    @form = NoteSaving.new
    @titles = (1..80).map { |n| "Title#{n}" }
  end

  def create
  end
end
