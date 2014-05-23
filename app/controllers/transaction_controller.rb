class TransactionController < ApplicationController

  def create
    @transaction = Transaction.create(transaction_params)
  end

  def show
    transaction = Transaction.find(params[:id])
    @how_long_ago = transaction.how_long_ago
    @ammount_in_units = transaction.ammount_in_units
    @actor = transaction.get_actor
    render :nothing => true    # In for purposes of testing, remove when page has view
  end

  private

  def transaction_params
      params.require(:item).permit(:user_id, :item_id, :action, :ammount_changed)
  end

end
