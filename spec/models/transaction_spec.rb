require 'spec_helper'

describe "New Transaction object" do
  let(:user) { User.create(first_name: "Robert", last_name: "Hoskins", email: "bob.hoskins@gmail.com") }
  let(:item) { Item.create(manufacturer: "Acme", name: "Dilithium Crystals", lot_number: "THX 1138", manufactured_on: "01/01/2000", expired_on: "01/01/2005") }
  let(:transaction) { Transaction.create(item_id: item.id, user_id: user.id) }

  it "should have a valid first name when a new transaction is created" do
    expect(transaction.user.first_name).to eq("Robert")
  end

  it "should have a valid last name when a new transaction is created" do
    expect(transaction.user.last_name).to eq("Hoskins")
  end

  it "should have a valid item name when a new transaction is created" do
    expect(transaction.item.name).to eq("Dilithium Crystals")
  end

  # What is this?
  # it "should have valid storage when a new transaction is created" do
  #   expect(transaction.storage).to eq("Gatorade, Hazardous")
  # end

  # it "should have the correct method when a new transaction is created" do
  #   expect(transaction.method).to eq("add")
  # end
end
