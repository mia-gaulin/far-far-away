class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @vacation = @booking.vacation
    if @booking.save
      flash[:notice] = "Itinerary updated successfully!"
    else
      flash[:alert] = "Itinerary not updated."
    end
    redirect_to vacation_path(@vacation)
  end

  private

  def booking_params
    params.permit(
      :vacation_id,
      :event_id
    )
  end
end
