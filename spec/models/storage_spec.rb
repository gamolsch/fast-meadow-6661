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

	xit "should have a storage limit of 8,192" do
		expect(Storage::StorageLimit).to eq(8_192)
	end

	xit "should return an array of colors" do
		first_color, second_color = [Color.new, Color.new]
		storage.colors << [first_color, second_color]

		expect(storage.colors).to match_array([first_color, second_color])
	end

	describe "#size" do
		it("should return the storage size") do
			first_item, second_item, third_item = [ Item.new, Item.new, Item.new ]
			storage.items << [first_item, second_item, third_item]

			expect(storage.size).to eq(3)
	  	end
	end
end

