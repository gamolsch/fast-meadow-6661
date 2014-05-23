ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 465,
	:domain => "smtp.gmail.com",
	:user_name => ENV["GMAIL_USERNAME"], #'gamolsch@gmail.com',
	:password => ENV["GMAIL_PASSWORD"], #'0l0a0b2n4u4m0b7e9r01',
	:authentication => "plain",
	:enable_starttls_auto => true,
	:ssl => true
}