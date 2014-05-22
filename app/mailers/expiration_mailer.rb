class ExpirationMailer < ActionMailer::Base
	ActionMailer::Base.default :from => 'default@development-server.com'
	#ActionMailer::Base.default :from => 'default@production-server.com'
  
  def expiration_confirmation(user)
  	mail :to => user.email, :subject => "Expired Items"
  end
end
