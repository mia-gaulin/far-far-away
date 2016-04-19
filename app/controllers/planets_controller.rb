class PlanetsController < ApplicationController
  def index
    @planets = Planet.order(:name).page params[:page]
  end
end
