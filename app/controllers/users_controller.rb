class UsersController < ApplicationController
  include UsersHelper

  def home
    health_percentages = {dataset: [[0, Item.expired_percent.round(2), "#DC011E"], [Item.expired_percent.round(2), Item.almost_expired_percent.round(2) + Item.expired_percent.round(2), "#F9CE47"], [Item.almost_expired_percent.round(2) + Item.expired_percent.round(2), 100, "#009865"]]}
    health_percentages_by_location = {:by_location => []}
    Storage.all.each do |loc|
      new_loc = []
      new_loc << Item.expired_percent_by_location(loc.id)
      new_loc << Item.almost_expired_percent_by_location(loc.id)
      new_loc << Item.not_pending_expired_percent_by_location(loc.id)
      health_percentages_by_location[:by_location] << new_loc
    end
    p @health_percentages_by_location = health_percentages_by_location.to_json
    @not_pending_expired = Item.not_pending_expired
    @health_percentages = health_percentages.to_json
  end

end
