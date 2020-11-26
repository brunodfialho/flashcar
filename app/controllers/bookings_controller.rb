class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to "booking_path"
  end

  private

  def booking_params
    @booking.require(:booking).permit(:date_begin, :date_end)
  end
end
