class EventsController < ApplicationController
  def index
    @planet = Planet.find(params[:planet_id])
    @events = Event.where(planet: @planet)
  end

  def show
    # @planet = Planet.find(params[:planet_id])
    @event = Event.find(params[:id])
  end
end
