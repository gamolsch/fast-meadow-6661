class Storage < ActiveRecord::Base

  CAPACITY = 8_192

  has_many :categories
  has_many :items, through: :categories, source: :items
  has_many :transactions

  validates :name, presence: true

  def add(items_params)
    if can_be_added?
      suggested_color = (create_new_color?) ? get_new_color : get_existing_color
      suggested_code = suggested_color.get_code

      new_item = Item.create(items_params)
      suggested_color.items << new_item
      new_item.code = suggested_code
      new_item.color = Category.find( new_item.category_id ).color
      new_item.save

      new_item
    end
  end

  def item_size
    items.count
  end

  def get_optimization_number
    storage_size = item_size
    optimal_value = Math.sqrt(storage_size).floor
    return 8 if optimal_value > 8
    return 1 if optimal_value == 0
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
    Array(categories).min{ |c1,c2| c1.item_size <=> c2.item_size }
  end

  def can_be_added?
    storage_size = item_size
    (storage_size + 1) < Storage::CAPACITY
  end

  private

  def items_params
     params.require(:items).permit(:manufacturer, :name, :manufactured_on, :expired_on, :lot_number, :unit_of_measure)
  end
end
