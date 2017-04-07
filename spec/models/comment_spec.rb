require 'rails_helper'

describe Comment do
	context 'when a comment is created' do
		before do
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.create(:user)
		end

		it 'is not valid' do
			expect(@product.comments.new(user: @user, rating: 5)).not_to be_valid
		end
	end
end