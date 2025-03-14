class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @spaces = current_user.spaces
    @bookings_as_owner = current_user.bookings_as_owner
    @bookings_as_client = current_user.bookings_as_client
  end
end
