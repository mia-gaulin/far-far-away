require 'rails_helper'

describe Planet do
  it { should have_many :vacations }
  it { should have_many :landmarks }

  it { should have_valid(:name).when("Tatooine", "Jakku") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:language).when("Basic", "Kaminoan") }
  it { should_not have_valid(:language).when(nil, "") }

  it { should have_valid(:description).when("If there's a bright center of the universe, you're on the planet it's furthest from.") }
  it { should_not have_valid(:description).when(nil, "") }
end
