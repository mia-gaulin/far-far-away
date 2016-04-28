class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @vacation = @note.vacation
    if @note.save
      render json: @note
    end
  end

  private

  def note_params
    params.require(:note).permit(
      :body
    ).merge(vacation: Vacation.find(params[:vacation_id]))
  end
end
