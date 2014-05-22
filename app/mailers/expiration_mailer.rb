class ExpirationMailer < ActionMailer::Base
	ActionMailer::Base.default :from => 'default@development-server.com'
	#ActionMailer::Base.default :from => 'default@production-server.com'
  
  def expiration_confirmation(user)
   @items = Item.All
    time = Time.now
    @user = user

	  @items.each do |item|
			if time > item.expired_on
				mail :to => @user.email, :subject => "Expired Items"
			else
				"not expired"
			end
	  end
end
