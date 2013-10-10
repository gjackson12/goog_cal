require 'spec_helper'

describe Room do
  it { should have_valid(:name).when("Ballroom") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:location).when("3rd Floor") }
  it { should_not have_valid(:location).when(nil, "") }

  it { should have_valid(:room_number).when("5", "Five") }
  it { should_not have_valid(:room_number).when(nil, "") }

  it { should have_valid(:calendar_id).when("") }
  it { should_not have_valid(:calendar_id).when(nil, "") }

  it { should belong_to(:events) }
end
