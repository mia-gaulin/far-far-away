class VacationsController < ApplicationController
  def show
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
    @landmarks = Landmark.where(planet: @planet)
    @events = Event.where(planet: @planet)
    @booking = Booking.new
    @bookings = @vacation.events
    @note = Note.new
    @notes = @vacation.notes.order(created_at: :desc)
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @planet = @vacation.planet

    if @vacation.save
      flash[:notice] = "Vacation booked successfully!"
      redirect_to vacation_path(@vacation)
    else
      flash[:error] = @vacation.errors.full_messages.join(". ")
      redirect_to planet_path(@planet)
    end
  end

  def edit
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
  end

  def update
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
    if @vacation.update(edit_params)
      flash[:notice] = "Vacation updated successfully!"
      redirect_to vacation_path(@vacation)
    else
      flash[:failure] = @vacation.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
    @vacation.destroy
    flash[:notice] = "Your vacation has been cancelled."
    redirect_to planets_path
  end

  # <%= button_to "X", api_vacation_note_path(n.vacation.id, n.id),
  #  class:"deleteNoteButton",
  # :method => :delete,
  # :form_class => "deleteNoteForm",
  # id: "#{n.id}" %>

  private

  def vacation_params
    params.require(:vacation).permit(
      :start_date,
      :end_date,
      :num_of_people,
      :vacationer
    ).merge(planet: Planet.find(params[:planet_id]))
  end

  def edit_params
    params.require(:vacation).permit(
      :start_date,
      :end_date,
      :num_of_people,
      :vacationer
    )
  end
end
