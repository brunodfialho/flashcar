class BookingsController < ApplicationController
  # before_action :authenticate_user!
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

  private

  def booking_params
    @booking.require(:booking).permit(:date_begin, :date_end, :total_price)
  end
end
