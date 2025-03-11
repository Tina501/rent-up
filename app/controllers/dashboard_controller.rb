class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @spaces = current_user.spaces
    @bookings = current_user.bookings
  end
end
