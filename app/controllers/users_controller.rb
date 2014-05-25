class UsersController < ApplicationController
  include UsersHelper

  def home
    @transactions = Transaction.last(5).reverse
    @expired_percent = Item.expired_percent
    @almost_expired = Item.almost_expired_percent
    @not_pending_expired = Item.not_pending_expired
  end

end
