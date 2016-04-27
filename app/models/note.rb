class Note < ActiveRecord::Base
  belongs_to :vacation

  validates :body, presence: true
end
