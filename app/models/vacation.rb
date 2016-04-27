require 'date'

class Vacation < ActiveRecord::Base
  belongs_to :planet
  belongs_to :user
  has_many :bookings
  has_many :events, through: :bookings
  has_many :notes

  accepts_nested_attributes_for :bookings

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :end_date, presence: true
  validate :end_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date
  validates :num_of_people, presence: true
  validates :num_of_people, numericality: true
  validates :vacationer, presence: true
  validates :planet, presence: true

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
end
