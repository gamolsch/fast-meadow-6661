class Storage < ActiveRecord::Base
	has_many :items

	def size
      self.items.length
    end
end
