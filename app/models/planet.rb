class Planet < ActiveRecord::Base
  has_many :vacations
  has_many :events
  has_many :landmarks

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :language, presence: true
  validates :sector, presence: true
  validates :region, presence: true
  validates :description, presence: true

  include PgSearch
  pg_search_scope :search_by_all, against: [:name, :language, :sector, :region]

  scope :search, -> (query) { search_by_all(query) if query.present? }

  paginates_per 10
end
