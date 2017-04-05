require 'rails_helper'

describe Comment do
	context 'when a comment is created' do
		before do
			@product = Product.create!(name: "mountain bike")
			@user = User.create!(email: "test@test.com", password: "testing", first_name: "tester")
		end

		it 'is not valid' do
			expect(@product.comments.new(user: @user, rating: 5)).not_to be_valid
		end
	end
end