require 'rails_helper'

describe Booking do
  it { should belong_to :event }
  it { should belong_to :vacation }
end
