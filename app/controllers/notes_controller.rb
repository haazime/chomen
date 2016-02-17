class NotesController < ApplicationController
  before_action :set_notes
  before_action :set_note, only: [:edit, :update]

  def new
    @note = Note.new
    render :note
  end

  def edit
    render :note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to edit_note_url(@note)
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to edit_note_url(@note)
    else
      render :edit
    end
  end

  private

    def note_params
      params.require(:note).permit(:content)
    end

    def set_notes
      @notes = Note.all
    end

    def set_note
      @note = Note.find(params[:id])
    end
end
