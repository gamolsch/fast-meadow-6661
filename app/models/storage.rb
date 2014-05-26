class Storage < ActiveRecord::Base

  CAPACITY = 8_192

  has_many :categories
  has_many :items, through: :categories, source: :items
  has_many :transactions

  validates :name, presence: true

  def get_optimization_number
    number = self.items.size
    number_of_colors = Math.sqrt(number).floor
    return 8 if number_of_colors > 8
    return number_of_colors
  end

  def create_new_color?
    current_size = self.categories.size
    ideal_size = get_optimization_number

    current_size < ideal_size
  end

end
