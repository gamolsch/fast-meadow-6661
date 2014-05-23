class User < ActiveRecord::Base
  has_many  :transactions

	def full_name
		"#{self.first_name}" + " #{self.last_name}"
	end

	def self.daily_update
    @users = User.all
    @users.each do |user|
      ExpirationMailer.expiration_confirmation(user.email).deliver
    end
  end

end
