require 'spec_helper'

describe Storage do
	let(:storage)  {Storage.new(name: "Gatorade Lab", hazardous: false)}
	let(:category) {Category.new(storage_id: storage.id)}

############################################################
# 			The following tests are ATTRIBUTE tests						 #
############################################################

	it "should be valid" do
		expect(storage).to be_valid
	end

	it "should be invalid without a name" do
		storage.name = nil
		expect(storage).not_to be_valid
	end

	it("should return correct name") do
		expect(storage.name).to eq("Gatorade Lab")
	end

	it "should have a storage capacity of 8,192" do
		expect(Storage::CAPACITY).to eq(8_192)
	end

#ENDTEST

############################################################
# 			The following tests are ASSOCIATION tests							#
############################################################

	xit("should return an array of items") do
		first_item, second_item, third_item = Array.new(3) { Item.new(unit_of_measure: "mL") }
		storage.items << [first_item, second_item, third_item]

		expect( Array(storage.items) ).to match_array([first_item, second_item, third_item])
	end

	it "should return an array of categories" do
		first_category, second_category = Array.new(2) { Category.new }
		storage.categories << [first_category, second_category]

		expect(storage.categories).to match_array([first_category, second_category])
	end

	describe "#item_size" do
			it "should return 0 by default" do
				expect(storage.item_size).to eq(0)
		  end

		  xit "should return 3 when 3 items are added" do
			end
	end

	describe "#category_size" do
		it "should return 0 by default" do
			expect(storage.category_size).to eq(0)
		end

		it "should return 5 when 5 categories are added" do
			storage.categories << Array.new(5) { Category.new }
			expect(storage.category_size).to eq(5)
		end
	end

#ENDTEST

	context "assigning a code to an item belonging to a category" do

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

