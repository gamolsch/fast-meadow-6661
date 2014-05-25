class UsersController < ApplicationController
  include UsersHelper

  def home
    health_percentages = {dataset: [[0, Item.expired_percent, "#DC011E"], [Item.expired_percent, Item.almost_expired_percent + Item.expired_percent, "#F9CE47"], [Item.almost_expired_percent + Item.expired_percent, 100, "#009865"]]}
    # @transactions = Transaction.last(5).reverse
    # @expired_percent = Item.expired_percent
    # @almost_expired = Item.almost_expired_percent
    @not_pending_expired = Item.not_pending_expired
    @health_percentages = health_percentages.to_json
  end

end
