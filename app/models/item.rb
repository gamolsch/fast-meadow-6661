require 'Date'
class Item < ActiveRecord::Base
  belongs_to :category
  has_many   :transactions

  # validates :unit_of_measure, presence: :true

  scope :expired, -> { where(["expired_on < ?", Time.now]) }
  scope :almost_expired, -> { where(expired_on: Time.now..14.days.from_now) }
  scope :not_expired, -> { where(expired_on: 14.days.from_now..100000.years.from_now) }

  def self.expired_percent
    (expired.count.to_f / Item.count.to_f) * 100
  end

  def self.almost_expired_percent
    (almost_expired.count.to_f / Item.count.to_f) * 100
  end

  def self.not_pending_expired
    (not_expired.count.to_f / Item.count.to_f) * 100
  end

  def self.expired_percent_by_location(location)
    total_chemicals = Storage.find(location).items
    expired_chemicals = total_chemicals.where(["expired_on < ?", Time.now]).count.to_f
    (expired_chemicals / total_chemicals.count.to_f) * 100
  end

  def self.almost_expired_percent_by_location(location)
    total_chemicals = Storage.find(location).items
    expired_chemicals = total_chemicals.where(expired_on: Time.now..14.days.from_now).count.to_f
    (expired_chemicals / total_chemicals.count.to_f) * 100
  end

  def self.not_pending_expired_percent_by_location(location)
    total_chemicals = Storage.find(location).items
    expired_chemicals = total_chemicals.where(expired_on: 14.days.from_now..100000.years.from_now).count.to_f
    (expired_chemicals / total_chemicals.count.to_f) * 100
  end

  def self.percent_of_total(location)
    total_chemicals = Storage.find(location).items.count
    total_at_location = (total_chemicals.to_f / Item.count.to_f) * 100
  end

  def current_amount
    current_amount = 0
    Transaction.where(item_id: self.id).each do |x|
      if x.action == "added"
          current_amount += x.ammount_changed
      elsif x.action == "updated"
        current_amount -= x.ammount_changed
      end
    end
    return current_amount
  end

  def calc_percent_of_total_remaining
    ((self.current_amount) / self.transactions.first.ammount_changed.to_f).round(2)
  end

  def calc_time_to_expiration
    date = DateTime.strptime(self.expired_on.to_s, "%Y-%m-%d")
    now = DateTime.now
    (date - now).to_i

  end
end
















