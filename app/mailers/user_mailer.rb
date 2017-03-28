class UserMailer < ApplicationMailer
	default from: "mail@paddlesup.com"

	def contact_form(email, name, message)
		@message = message
		mail( :from => email, :to => "roxwel.ruiz@gmail.com", :subject => "Paddle Up'er #{name} has sent you a message!" )
	end

	def welcome(user)
		@appname = "Paddles Up"
		mail( :to => user.email, :subject => "#{@appname}!! Go!!" )
	end
end
