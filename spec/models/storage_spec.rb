require 'spec_helper'

describe Storage do
	let(:storage) {Storage.create(name: "gatorade lab")}

	it("should return correct name of the storage") do
		expect(storage.name).to eq("gatorade lab")
	end

	it("should return an array of items when items is called") do
		first_item = Item.new
		second_item = Item.new
		third_item = Item.new
		storage.items << ([first_item, second_item, third_item])
		expect(storage.items.to_a).to match_array([first_item, second_item, third_item])
	end
    
	describe "#size" do
		it("should return the storage size") do
			storage.items << Item.create
			storage.items << Item.create
			storage.items << Item.create
			expect(storage.size).to eq(3)
	  	end
	end	
end

