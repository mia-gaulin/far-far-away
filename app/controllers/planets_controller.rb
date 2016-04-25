class PlanetsController < ApplicationController
  def index
    if params[:query]
      @planets = Planet.search(params[:query]).order(:name)
    else
      @planets = Planet.order(:name).page params[:page]
    end
  end

  def show
    @planet = Planet.find(params[:id])
    @planet_data = api_parse
    @landmarks = Landmark.where(planet: @planet)
    @events = Event.where(planet: @planet)
    @vacation = Vacation.new
  end

  private

  def api_parse
    @planet = Planet.find(params[:id])
    apicall = Swapi.get_planet @planet.id
    a = apicall.gsub(", ", "&")
    b = a.gsub(",", "//")
    c = b.gsub("&", ", ")
    c.gsub(/[{}\"]/, '').split('//').map { |h| h1, h2 = h.split(':'); {
      h1 => h2 } }.reduce(:merge)
  end
end
