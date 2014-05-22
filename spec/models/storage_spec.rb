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

	it "should have a storage capacity of 8,192" do
		expect(Storage::CAPACITY).to eq(8_192)
	end

	it "should return an array of categories" do
		first_category, second_category = [Category.new, Category.new]
		storage.colors << [first_category, second_category]

		expect(storage.colors).to match_array([first_category, second_category])
	end

	describe "#get_number_of_items" do
			it("should return the storage size") do
				first_item, second_item, third_item = [ Item.new, Item.new, Item.new ]
				storage.items << [first_item, second_item, third_item]

				expect(storage.get_number_of_items).to eq(3)
		  	end
		end

	describe "#get_number_of_colors" do
		it "should return the correct number" do
			first_category, second_category = [ Category.new, Category.new ]
			storage.colors << [first_category, second_category]

			expect(storage.get_number_of_colors).to eq(2)
		end
	end

	context "assigning a code to an item belonging to color" do

		describe '#get_optimization_number' do
			xit "should return 8 when recommendation is greater than 8" do
				dozen_items = Array.new(12) { Item.new }
				storage.items << dozen_items

				expect(storage.get_optimization_number).to eq(8)
			end

			xit "should return 2 when storage size is 5" do
				five_items = Array.new(5) { Item.new }
				storage.items << five_items

				expect(storage.get_optimization_number).to eq(2)
			end

			xit "should return 1 when storage size is 1" do
				one_item = Item.new
				storage.items << one_item

				expect(storage.get_optimization_number).to eq(1)
			end

			xit "should return 0 when storage size is 0" do
				expect(storage.get_optimization_number).to eq(0)
			end
		end
	end
end

