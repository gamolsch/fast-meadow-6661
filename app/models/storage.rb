class Storage < ActiveRecord::Base

  CAPACITY = 8_192

  has_many :categories
  has_many :items, through: :categories, source: :items
  has_many :transactions

  validates :name, presence: true

  def get_optimization_number
    storage_size = items.size
    optimal_value = Math.sqrt(storage_size).floor
    return 8 if optimal_value > 8
    return optimal_value
  end

  def create_new_color?
    current_size = categories.size
    ideal_size = get_optimization_number

    current_size < ideal_size
  end

end
