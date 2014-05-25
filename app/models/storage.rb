class Storage < ActiveRecord::Base

  CAPACITY = 8_192

  has_many :categories
  has_many :items, through: :categories
  has_many :transactions

  validates :name, presence: true
end
