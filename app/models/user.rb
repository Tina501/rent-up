class User < ApplicationRecord
  has_many :spaces, dependent: :destroy
  has_many :bookings_as_client, dependent: :destroy, class_name: 'Booking', foreign_key: :user_id
  has_many :bookings_as_owner, dependent: :destroy, through: :spaces, source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :role, :string, default: 'client' # Explicitly declare attribute type

  private

  def set_default_role
    self.role ||= 'client'
  end
end
