class Storage < ActiveRecord::Base
  has_many :categories
  has_many :items, through: :categories
end
