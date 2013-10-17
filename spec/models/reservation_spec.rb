require 'spec_helper'

describe Reservation do
  it{should have_valid(:summary).when("asdfkabsdf")}
  it{should_not have_valid(:summary).when(nil, " ")}

  it{should have_valid(:description).when("asdfkabsdf")}
  it{should_not have_valid(:description).when(nil, " ")}

  it{should have_valid(:start_at).when(DateTime.now)}
  it{should_not have_valid(:start_at).when(nil, " ")}

  it{should have_valid(:end_at).when(DateTime.now)}
  it{should_not have_valid(:end_at).when(nil, " ")}
end