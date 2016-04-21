require 'rails_helper'

describe Landmark do
  it { should belong_to :planet }

  it { should have_valid(:name).when("Mos Eisley") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:location).when("Tatooine", nil, "") }
end
