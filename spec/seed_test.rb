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
