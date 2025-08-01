class Admin::DashboardController < ApplicationController

  def show
    @products = Product.all
    @categories = Category.all
  end

  def total_product_count
    @products.map {|entry| entry[:quantity]}.sum
  end
  helper_method :total_product_count

  def total_category_count
    @categories.count
  end
  helper_method :total_category_count
end