class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @vacation = @booking.vacation
    if @booking.save
      flash[:notice] = "Itinerary updated successfully!"
    else
      flash[:failure] = "Itinerary not updated."
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

# <h4>Book events on <%= @vacation.planet.name %></h4>
# <%= form_for [@vacation, @booking] do |f| %>
#   <% @events.each do |event| %>
#   <span><%= event.name %></span>
#   <%= check_box_tag :event_id, event.id %><br />
#   <% end %>
#   <%= f.submit 'Add to trip' %>
# <% end %>
