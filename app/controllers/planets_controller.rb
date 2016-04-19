class PlanetsController < ApplicationController
  def index
    @planets = Planet.order(:name).page params[:page]
  end

  def show
    @planet = Planet.find(params[:id])
  end
end
