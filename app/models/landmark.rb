class Landmark < ActiveRecord::Base
  belongs_to :planet

  validates :name, presence: true
  validates :planet, presence: true
end
