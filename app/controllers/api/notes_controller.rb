class Api::NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note.to_json,
      status: :created,
      location: api_vacation_note_url(@vacation, @comment)
    else
      render json: @note.errors,
      status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: nil, status: :ok
  end

  private

  def note_params
    params.require(:note).permit(
      :body
    ).merge(vacation: Vacation.find(params[:vacation_id]))
  end
end
