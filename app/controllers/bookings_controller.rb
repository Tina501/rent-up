class BookingsController < ApplicationController
  before_action :set_space, only: [:new, :create]  # Ensures @space is available for both new and create actions
  before_action :set_booking, only: [:accept, :decline]  # Sets the @booking for the accept and decline actions

  # Shows the form to create a new booking for a space
  def new
    @booking = @space.bookings.new
  end

  # Creates a new booking for the space
  def create
    @booking = @space.bookings.new(booking_params)
    @booking.user = current_user  # Assuming you're associating bookings with the current user

    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created.'
    else
      render 'spaces/show'  # Renders the space page again if booking creation fails
    end
  end

  # Accept a booking request
  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    redirect_to dashboard_path, notice: "Booking accepted successfully."
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.declined!
    redirect_to dashboard_path, alert: "Booking declined."
  end

  private

    # Sets the space based on the space_id parameter
    def set_space
      @space = Space.find(params[:space_id])
    end

    # Sets the booking based on the booking ID for accept/decline actions
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Strong parameters for the booking
    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
end
