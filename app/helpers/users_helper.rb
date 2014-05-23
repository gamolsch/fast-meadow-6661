module UsersHelper
  def create_transaction_string
    @transaction_strings = []
    Transactions.last(5).each do |trans|
      if trans.action == "expired"
        joiner = "in"
      else
        joiner = "to"
      end
      @transaction_strings << "#{trans.how_long_ago} | #{trans.get_actor} #{trans.action} #{trans.get_item} #{joiner} #{trans.get_location}"
    end
    return @transaction_strings
  end
end
