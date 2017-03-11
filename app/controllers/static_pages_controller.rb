class StaticPagesController < ApplicationController
  def preindex
  end

  def go_to_main
  	redirect_to "/index"
  end

  def index
   	# retrieve the first product in Products table and set it to @featured_product
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end

  def message_sent
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    UserMailer.contact_form(@email, @name, @message).deliver_now
    #ActionMailer::Base.mail(:from => @email, :to => 'roxwel.ruiz@gmail.com', :subject => "Paddle Up'er #{@name} has sent you a message!", :body => @message).deliver_now
  end
end
