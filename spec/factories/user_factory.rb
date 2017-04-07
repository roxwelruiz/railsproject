FactoryGirl.define do
	sequence(:email) { |n| "test#{n}@test.com" }

	factory :user do
		email # same as 'email { generate(:email) }'
		password "testing"
		first_name "test"
		last_name "tester"
		admin false
	end

	factory :admin, class: User do
		email
		password "testing"
		first_name "admin"
		last_name "tester"
		admin true
	end
end