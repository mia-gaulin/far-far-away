class Booking < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :event
end
