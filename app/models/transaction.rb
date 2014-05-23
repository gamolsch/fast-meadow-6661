class Transaction < ActiveRecord::Base
  belongs_to    :item
  belongs_to    :user

  def how_long_ago
    time_back =  Time.now - self.created_at
    if time_back < 3600
      return "#{(time_back / 60).round} minutes ago."
    else
      return "#{(time_back / 3600).round} hours ago."
    end
  end

  def ammount_in_units
    item = Item.find(self.id)
    return "#{self.ammount_changed} #{item.unit_of_measure} #{self.action}"
  end

  def get_actor
    user = User.find(self.user_id)
    return "#{user.first_name} #{user.last_name}"
  end

  def get_item
    item = Item.find(self.item_id)
    return item.name
  end

  def get_location
    item = Item.find(self.item_id)
    return item.category.storage.name
  end
end










