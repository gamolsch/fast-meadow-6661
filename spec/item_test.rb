require 'spec_helper'
require_relative '../app/models/item.rb'

describe "New item object" do
  let(:chemical) {Item.create(storage: "Your moms house", hazardous: false, manufacturer: "Acme", name: "Dilithium Crystals", lot_number: "THX 1138", manufactured_on: "01/01/2000", expired_on: "01/01/2005")}

  it("should have correct values when new Item is created.") do
    expect(chemical.storage).to eq("Your moms house")
    expect(chemical.hazardous).to eq(false)
    expect(chemical.manufacturer).to eq("Acme")
    expect(chemical.name).to eq("Dilithium Crystals")
    expect(chemical.lot_number).to eq("THX 1138")
  end
end
