class AddDefaultValueForStatusOnBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, "pending"
  end
end
