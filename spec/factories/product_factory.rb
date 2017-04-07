FactoryGirl.define do
	sequence(:name) { |n| "generic product no. #{n}" }

	factory :product do
		name # name { generate(:name) }
		description "generic description"
		detailed_description "a more detailed description of this product"
	end
end