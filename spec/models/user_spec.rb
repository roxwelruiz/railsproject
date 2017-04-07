require 'rails_helper'

describe User do
	context 'when the new user logs in' do
		before do
			@user = FactoryGirl.build(:user, email: "not_an_email")
		end

		it 'should not validate the user without an email address' do
			expect(@user).to_not be_valid
		end
	end
end