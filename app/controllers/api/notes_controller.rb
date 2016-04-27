class Api::NotesController < ApplicationController
  # def index
  #   @vacation = Vacation.find(params[:vacation_id])
  #   @notes = @vacation.notes.order("created_at DESC")
  #   render json: { notes: @notes }
  # end
  #
  # def show
  #   @note = Note.find(params[:id])
  #   render json: { notes: @notes }
  # end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: { notes: @note },
        status: :created,
        location: api_vacation_note_url(@vacation, @comment)
    else
      render json: @note.errors,
        status: :unprocessable_entity
    end
  end
  #
  # def update
  #   @note = Note.find(params[:id])
  #   if @note.update(note_params)
  #     render json: { notes: @note }
  #   else
  #     render json: @note.errors,
  #       status: :unprocessable_entity
  #   end
  # end

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
