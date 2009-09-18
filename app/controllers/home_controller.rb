class HomeController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @cars = Car.find(params[:id])
  end

end

