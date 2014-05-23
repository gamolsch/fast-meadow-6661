module UsersHelper
  def create_transaction_string
    @transaction_strings = []
    Transactions.last(5).each do |trans|
      @transaction_strings << "#{trans.how_long_ago} | #{trans.get_actor} #{trans.action} "
    end
  end
end
