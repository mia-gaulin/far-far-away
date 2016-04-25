class VacationsController < ApplicationController
  def new
    @planet = Planet.find(params[:planet_id])
    @vacation = Vacation.new
  end

  def show
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
    @landmarks = Landmark.where(planet: @planet)
    @events = Event.where(planet: @planet)
    @booking = Booking.new
    @booking.vacation = @vacation
    @vacation.bookings.build
  end

  def create
    @vacation = Vacation.new(vacation_params)
    @planet = @vacation.planet

    if @vacation.save
      flash[:notice] = "Vacation booked successfully!"
      redirect_to vacation_path(@vacation)
    else
      flash[:error] = @vacation.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
  end

  def update
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
    binding.pry
    if @vacation.update(edit_params)
      flash[:notice] = "Vacation updated successfully!"
      redirect_to vacation_path(@vacation)
    else
      flash[:alert] = @vacation.errors.full_messages.join(". ")
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

  def add
    @vacation = Vacation.find(params[:id])
    if request.post?
      @event = Event.find(params[:event_id])
      @vacation.bookings << @event
    end
  end

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
