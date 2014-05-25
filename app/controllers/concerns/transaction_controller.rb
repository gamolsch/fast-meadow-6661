class ItemsController < ApplicationController

  def create
    transaction = Transaction.create(transaction_params)

  end

  private

  def transaction_params
      params.require(:item).permit(:user_id, :item_id, :action, :ammount_changed)
    end

end
