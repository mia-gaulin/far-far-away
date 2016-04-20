class VacationsController < ApplicationController
  def new
    @planet = Planet.find(params[:planet_id])
    @vacation = Vacation.new
  end

  def show
    @vacation = Vacation.find(params[:id])
    @planet = @vacation.planet
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

  private

  def vacation_params
    params.require(:vacation).permit(
      :start_date,
      :end_date,
      :num_of_people,
      :vacationer
    ).merge(planet: Planet.find(params[:planet_id]))
  end
end
