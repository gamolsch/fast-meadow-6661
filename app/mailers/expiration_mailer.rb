class ExpirationMailer < ActionMailer::Base
	ActionMailer::Base.default :from => 'default@development-server.com'
	#ActionMailer::Base.default :from => 'default@production-server.com'
  
  def expiration_confirmation(email)
   @items = Item.all
    time = Time.now

	  @items.each do |item|
			if time > item.expired_on
				mail :to => email, :subject => "Expired Items"
			else
				"not expired"
			end
	  end
	end
end