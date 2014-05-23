require 'spec_helper'

describe Storage do
	let(:storage) {Storage.create(name: "gatorade lab", hazardous: false)}
	let(:category) {Category.create(storage_id: storage.id)}

	it("should return correct name of the storage") do
		expect(storage.name).to eq("gatorade lab")
	end

	# it("should return an array of items when items is called") do
	# 	first_item = Item.new(category_id: category.id)
	# 	second_item = Item.new(category_id: category.id)
	# 	third_item = Item.new(category_id: category.id)
	# 	expect(storage.items.to_a).to eq([first_item, second_item, third_item])
	# end

	# describe "#size" do
	# 	it("should return the storage size") do
	# 		storage.items.create(Item.new, Item.new, Item.new)
	# 		expect(storage.size).to eq(3)
	#   	end
	# end
end

