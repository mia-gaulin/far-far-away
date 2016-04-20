class Event < ActiveRecord::Base
  belongs_to :planet

  validates :name, presence: true
  validates :location, presence: true
end
