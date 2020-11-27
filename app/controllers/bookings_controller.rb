class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @booking = Booking.new(booking_params)
    car = Car.find(params[:car_id])
    @booking.car = car
    @booking.user = current_user
    @booking.total_price = (@booking.date_end - @booking.date_begin).to_i * @booking.car.price.to_i
    if @booking.save
      redirect_to my_bookings_path
    else
      render "show"
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_begin, :date_end)
  end
end
