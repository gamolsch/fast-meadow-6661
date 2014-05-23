class Category < ActiveRecord::Base
  belongs_to :storage
  has_many :items
end
