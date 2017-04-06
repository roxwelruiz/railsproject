require 'rails_helper'

describe UsersController, :type => :controller do

	let(:user) { User.create!(email: 'test@test.com', password: 'testing') }
	let(:user_b) { User.create!(email: 'admin@test.com', password: 'admin1') }

	describe 'GET #show' do
		context 'User is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do
				get :show, params: { id: user.id }
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
		end

		context 'no user is logged in' do
			it 'redirects to sign in' do
				get :show, params: { id: user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'first user cannot access second user' do
			it 'redirects to home' do
				get :show, params: { id: user.id }
				expect(response).to have_http_status(302)
				expect(assigns(:user_b)).not_to eq user
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end