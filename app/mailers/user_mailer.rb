class UserMailer < ApplicationMailer
	default from: "contact@paddlesup.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email, :to => "roxwel.ruiz@gmail.com", :subject => "Paddle Up'er #{name} has sent you a message!")
	end
end
