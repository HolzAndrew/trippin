class UserMailer < ApplicationMailer

	default from: "trippinga2016@gmail.com"

	def welcome_email(invitation)
		@invitation = invitation
		@url = "http://localhost3000"
		# binding.pry
		mail to: @invitation.email, subject: "Welcome to Day Trippr!"
	end

end