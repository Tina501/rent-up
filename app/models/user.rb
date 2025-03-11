class User < ApplicationRecord
  has_many :spaces, dependent: :destroy
  has_many :bookings, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :role, :string, default: 'client' # Explicitly declare attribute type

  private

  def set_default_role
    self.role ||= 'client'
  end
end
