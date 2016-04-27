class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @vacation = @note.vacation
    if @note.save
      flash[:notice] = "Note saved!"
    else
      flash[:failure] = @note.errors.full_messages.join(". ")
    end
    redirect_to vacation_path(@vacation)
  end

  private

  def note_params
    params.require(:note).permit(
      :body
    ).merge(vacation: Vacation.find(params[:vacation_id]))
  end
end

# <%= button_to "Delete Note", api_vacation_note_path(n.vacation.id, n.id), class:"button", :method => :delete %>
