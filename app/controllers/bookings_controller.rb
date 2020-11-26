class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to bookings_index_path
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    @booking.require(:booking).permit(:date_begin, :date_end, :total_price)
  end
end
