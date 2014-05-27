class UsersController < ApplicationController
  include UsersHelper

  def home
    health_percentages = {global: [[0, Item.expired_percent.round(2), "#DC011E"], [Item.expired_percent.round(2), Item.almost_expired_percent.round(2) + Item.expired_percent.round(2), "#F9CE47"], [Item.almost_expired_percent.round(2) + Item.expired_percent.round(2), 100, "#009865"]]}
    health_percentages_by_location = {:by_location => []}
    storages = {:location => []}
    overall_percentage = {:location_total => []}
    Storage.all.each do |loc|
      storages[:location] << loc.name
      overall_percent = Item.percent_of_total(loc.id).round(2)
      overall_percentage[:location_total] << overall_percent
      new_loc = []
      new_loc << (Item.expired_percent_by_location(loc.id) * overall_percent / 100).round(2)
      new_loc << (Item.almost_expired_percent_by_location(loc.id) * overall_percent / 100).round(2)
      new_loc << (Item.not_pending_expired_percent_by_location(loc.id) * overall_percent / 100).round(2)
      health_percentages_by_location[:by_location] << new_loc
    end
    @overall_percentage = overall_percentage.to_json
    @health_percentages_by_location = health_percentages_by_location.to_json
    @storages = storages.to_json
    @not_pending_expired = Item.not_pending_expired
    @health_percentages = health_percentages.to_json
    @transactions = Transaction.last(5).reverse
  end

  def dashboard
    render 'dashboard', layout: false
  end
end
