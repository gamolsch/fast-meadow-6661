class Item < ActiveRecord::Base
  belongs_to :category

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
end
