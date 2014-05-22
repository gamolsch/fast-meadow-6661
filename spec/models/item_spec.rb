require 'spec_helper'

describe Item do
  describe ".expired_percent" do
    it "should calculate the expired percent correctly" do
      Item.create!(expired_on: 3.days.ago)
      Item.create!(expired_on: 2.days.ago)
      Item.create!(expired_on: 2.days.from_now)
      expect(Item.expired_percent.round(3)).to eq(66.667)
    end
  end

  describe "new item" do
    let(:chemical) { Item.create(manufacturer: "Acme", name: "Dilithium Crystals", lot_number: "THX 1138", manufactured_on: "01/01/2000", expired_on: "01/01/2005") }

    it("should have correct values when new Item is created.") do
      expect(chemical.manufacturer).to eq("Acme")
      expect(chemical.name).to eq("Dilithium Crystals")
      expect(chemical.lot_number).to eq("THX 1138")
    end
  end

  describe "calculate item percent" do
    # let(:one) {Item.create(expired_on: 10.days.ago)}
    # let(:two) {Item.create(expired_on: 30.days.from_now)}
    # let(:three) {Item.create(expired_on: 10.days.from_now)}

    it ("should return the correct percent of expired items") do
      one = Item.create(expired_on: 10.days.ago)
      two = Item.create(expired_on: 30.days.from_now)
      three = Item.create(expired_on: 10.days.from_now)
      expect(Item.expired_percent).to eq(33.33333333333333)
    end

    it ("should return the correct percent of items which will expire soon") do
      one = Item.create(expired_on: 10.days.ago)
      two = Item.create(expired_on: 30.days.from_now)
      three = Item.create(expired_on: 10.days.from_now)
      expect(Item.almost_expired_percent).to eq(33.33333333333333)
    end

    it ("should return the correct percent of non-expired items") do
      one = Item.create(expired_on: 10.days.ago)
      two = Item.create(expired_on: 30.days.from_now)
      three = Item.create(expired_on: 10.days.from_now)
      expect(Item.not_pending_expired).to eq(33.33333333333333)
    end

  end
end




