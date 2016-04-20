require 'rails_helper'

describe User do
  it { should have_valid(:first_name).when("Luke", "Leia") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Skywalker", "Organa") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when("user@example.com") }
  it { should_not have_valid(:email).when("foo", "foo.com", "@") }
end
