class UserMailer < ApplicationMailer

	default from: "trippinga2016@gmail.com"

	def welcome_email(user)
		@user = user
		@url = "http://localhost3000/login"
		binding.pry
		mail to: @user.email, subject: "Welcome to Trippr!"
	end



end