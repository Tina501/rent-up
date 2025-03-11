class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :start_date, :end_date, presence: true
  validate :valid_date_range

  enum status: { pending: "pending", accepted: "accepted", declined: "declined" }

  def valid_date_range
    if start_date && end_date && start_date >= end_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
