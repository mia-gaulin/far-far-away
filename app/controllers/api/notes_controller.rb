class Api::NotesController < ApplicationController
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: nil, status: :ok
  end
end
