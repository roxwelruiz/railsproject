class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	# retrieve the first product in Products table and set it to @featured_product
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end

end
