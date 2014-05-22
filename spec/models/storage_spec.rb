require 'spec_helper'

describe Storage do
	let(:storage) {Storage.create(name: "Gatorade Lab")}

	it("should return correct name") do
		expect(storage.name).to eq("Gatorade Lab")
	end

	it("should return an array of items") do
		first_item, second_item, third_item = [ Item.new, Item.new, Item.new ]
		storage.items << [first_item, second_item, third_item]

		expect( Array(storage.items) ).to match_array([first_item, second_item, third_item])
	end
    
	describe "#size" do
		it("should return the storage size") do
			first_item, second_item, third_item = [ Item.new, Item.new, Item.new ]
			storage.items << [first_item, second_item, third_item]
			
			expect(storage.size).to eq(3)
	  	end
	end	
end

