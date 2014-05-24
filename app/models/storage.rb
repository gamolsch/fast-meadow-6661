class Storage < ActiveRecord::Base
  has_many :categories
  has_many :items, through: :categories
  has_many :transactions

	def size
      self.items.length
  end
end
