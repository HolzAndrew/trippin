class UserMailer < ApplicationMailer

	default from: "from@example.com"

	def welcome_email(invitation)
		@invitation = invitation
		@url = "http://daytrippr.herokuapp.com/"
		# binding.pry
		mail to: @invitation.email, subject: "Welcome to Day Trippr!"

	end

end