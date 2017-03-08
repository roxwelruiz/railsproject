class StaticPagesController < ApplicationController
  def preindex
  end

  def go_to_main
  	redirect_to "/index"
  end

  def index
   	# retrieve the first product in Products table and set it to @featured_product
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end
end
