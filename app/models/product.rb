class Product < ApplicationRecord
	has_many :orders

	def self.search(search_str)
		if Rails.env.development?
			like_operator = "LIKE"
		else
			like_operator = "ilike"
		end

		Product.where("name #{like_operator} ?", "%#{search_str}%")
	end
end
