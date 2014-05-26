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

  def get_new_color
    existing_colors = categories.map(&:color)
    all_colors = Category::AllColors

    available_colors = all_colors - existing_colors
    new_color = available_colors.sample

    return nil if new_color.nil?
    new_category = Category.create(storage_id: id, color: new_color)
    categories << new_category
    new_category
  end

  def get_existing_color
    Array(categories).min{ |c1,c2| c1.items.size <=> c2.items.size }
  end

  def can_be_added?
    storage_size = items.size
    (storage_size + 1) < Storage::CAPACITY
  end

end
