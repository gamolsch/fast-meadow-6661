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

	xit "should have a storage capacity of 8,192" do
		expect(Storage::Capacity).to eq(8_192)
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

	describe '#get_optimization_number' do
		it "should return 8 when recommendation is greater than 8" do
			dozen_items = Array.new(12) { Item.new }
			storage.items << dozen_items

			expect(storage.get_optimization_number).to eq(8)
		end

		it "should return 2 when storage size is 5" do
			five_items = Array.new(5) { Item.new }
			storage.items << five_items

			expect(storage.get_optimization_number).to eq(2)
		end

		it "should return 1 when storage size is 1" do
			one_item = Item.new
			storage.items << one_item

			expect(storage.get_optimization_number).to eq(1)
		end

		it "should return 0 when storage size is 0" do
			expect(storage.get_optimization_number).to eq(0)
		end
	end
end

