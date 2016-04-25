class Event < ActiveRecord::Base
  belongs_to :planet
  has_many :bookings
  has_many :vacations, through: :bookings

  validates :name, presence: true
end
