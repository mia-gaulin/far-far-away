require 'rails_helper'

describe Vacation do
  it { should belong_to :planet }

  it { should have_valid(:start_date).when("2016-06-22") }
  it { should_not have_valid(:start_date).when("2015-06-22", nil, "") }

  it { should have_valid(:end_date).when("2016-06-27") }
  it { should_not have_valid(:end_date).when("2015-06-27", nil, "") }

  it { should have_valid(:num_of_people).when("5", "2") }
  it { should_not have_valid(:num_of_people).when(nil, "", "Six") }

  it { should have_valid(:vacationer).when("Han Solo", "Skywalker") }
  it { should_not have_valid(:vacationer).when(nil, "") }
end
