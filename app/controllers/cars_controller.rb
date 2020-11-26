class CarsController < ApplicationController
  def index
    @cars = Car.all
    @markers = @cars.map do |car|
      { lat: car.latitude, lng: car.longitude }
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_index_path
  end

  private

  def car_params
    @car.require(:car).permit(:name, :description, :price, :model)
  end
end
