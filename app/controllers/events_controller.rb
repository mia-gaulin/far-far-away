class EventsController < ApplicationController
  def index
    @planet = Planet.find(params[:planet_id])
    @events = Event.where(planet: @planet)
  end
end
