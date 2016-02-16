class UserMailer < ApplicationMailer

	default from: "from@example.com"

	def welcome_email(invitation)
		@invitation = invitation
		@url = "http://localhost:3000"
		# binding.pry
		mail to: @invitation.email, subject: "Welcome to Day Trippr!"

	end

end