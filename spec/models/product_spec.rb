require 'rails_helper'

describe Product do
	context 'when the product has comments' do
		before do
			@product = Product.create!(name: "race bike")
			@user = User.create!(email: "test@test.com", password: "testing", first_name: "tester")
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike")
			@product.comments.create!(rating: 3, user: @user, body: "Meh bike")
			@product.comments.create!(rating: 5, user: @user, body: "Great bike")
		end

		it 'returns the average rating of all comments' do
			expect(@product.average_rating).to eq 3.0
		end

		it 'is not valid' do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end