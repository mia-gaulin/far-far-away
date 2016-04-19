class Planet < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :language, presence: true
  validates :sector, presence: true
  validates :region, presence: true

  paginates_per 10
end
