class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @spaces = current_user.spaces
    @bookings = current_user.bookings
  end
end
