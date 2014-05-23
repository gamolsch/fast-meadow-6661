require 'spec_helper'
require_relative '../db/seeds.rb'

describe "String splitting method" do
  it "should return a two element array." do
    working_string = "First part, second part"
    output_array = split_location_string(working_string)
    output_array.should have(2).items
    expect(output_array.length).to eq(2)
  end

  it "should return false for anything other then 'Hazardous'" do
    hazard_string = "dummy, Hazardous"
    non_hazard_string = "dummy, Cupcake"
    hazard_array = split_location_string(hazard_string)
    non_hazard_array = split_location_string(non_hazard_string)
    expect(determine_if_hazardous(hazard_array)).to eq(true)
    expect(determine_if_hazardous(non_hazard_array)).to be_false
  end

end

describe "Location setting method" do

  it "should return 1 for 'Gatorade Lab, Hazardous'." do
    expect(determine_storage_loc("Gatorade Lab, Hazardous")).to eq(1)
  end
  it "should return 2 for 'Gatorade Lab, Non-Hazardous'." do
    expect(determine_storage_loc("Gatorade Lab, Non-Hazardous")).to eq(2)
  end
  it "should return 3 for 'Gatorade Lab, Main Inventory'." do
    expect(determine_storage_loc("Gatorade Lab, Main Inventory")).to eq(3)
  end
  it "should return 4 for 'Pilot Plant, Hazardous'." do
    expect(determine_storage_loc("Pilot Plant, Hazardous")).to eq(4)
  end
  it "should return 5 for 'Pilot Plant, Non-Hazardous'." do
    expect(determine_storage_loc("Pilot Plant, Non-Hazardous")).to eq(5)
  end
end














