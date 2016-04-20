require 'rails_helper'

describe Event do
  it { should belong_to :planet }

  it { should have_valid(:name).when("Podracing") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:location).when("Mos Espa") }
  it { should_not have_valid(:location).when(nil, "") }

  it { should have_valid(:description).when("Zoom", nil, "") }
end
