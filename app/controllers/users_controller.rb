class UsersController < ApplicationController
  include UsersHelper

  def home
    @transactions = Transaction.last(5).reverse
    # @transactions = create_transaction_string
    p @transactions
  end

end
