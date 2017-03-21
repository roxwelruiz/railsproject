class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	validates :name, presence: true

	def self.search(search_str)
		if Rails.env.development?
			like_operator = "LIKE"
		else
			like_operator = "ilike"
		end

		Product.where("name #{like_operator} ?", "%#{search_str}%")
	end

	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end
end
