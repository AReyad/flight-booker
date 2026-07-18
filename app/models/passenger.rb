class Passenger < ApplicationRecord
  validates :email, :name, presence: true
  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings
end
