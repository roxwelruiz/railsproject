if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_isHuaoXpxgL0lZmjuWU3xBXA',
		:secret_key => 'sk_test_NFS57aS2aXw1vocVZtxGo85S'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]