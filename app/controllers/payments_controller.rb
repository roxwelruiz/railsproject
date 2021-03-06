class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user

		token = params[:stripeToken]

		# create the charge on Stripe's servers - this will charge the user's card

		begin
			charge = Stripe::Charge.create(
				:amount => (@product.price * 100).to_i,
				:currency => 'usd',
				:source => token,
				:description => @product.name + " purchased by " + params[:stripeEmail],
				:receipt_email => @user.email
				)

			if charge.paid
				Order.create(:user_id => @user.id, :product_id => @product.id, :total => @product.price)
				flash[:notice] = "Purchase Approved."
			end

		rescue Stripe::CardError => e
		  # Since it's a decline, Stripe::CardError will be caught
		  body = e.json_body
		  err  = body[:error]

		  flash[:alert] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

		rescue Stripe::RateLimitError => e
		  # Too many requests made to the API too quickly
		rescue Stripe::InvalidRequestError => e
		  # Invalid parameters were supplied to Stripe's API
		rescue Stripe::AuthenticationError => e
		  # Authentication with Stripe's API failed
		  # (maybe you changed API keys recently)
		rescue Stripe::APIConnectionError => e
		  # Network communication with Stripe failed
		rescue Stripe::StripeError => e
		  # Display a very generic error to the user, and maybe send
		  # yourself an email
		rescue => e
		  # Something else happened, completely unrelated to Stripe
		end
		
		redirect_to @product
	end
end
