class Planet < ActiveRecord::Base
  has_many :vacations
  has_many :events

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :language, presence: true
  validates :sector, presence: true
  validates :region, presence: true
  validates :description, presence: true

  paginates_per 10
end
