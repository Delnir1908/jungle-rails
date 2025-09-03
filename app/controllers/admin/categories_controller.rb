class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with \
    name: ENV["BASIC_AUTH_NAME"],
    password: ENV["BASIC_AUTH_PASSWORD"],
    only: [:index, :new, :create]

  def index
    # Load all categories, descending by ID
    @categories = Category.order(id: :desc).all
  end

  def new
    # Create a new, empty Category instance
    @category = Category.new
  end

  def create
    # Build a new category from form parameters
    @category = Category.new(category_params)

    # Try to save, redirect or show the form again
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    # Only permit the name field
    params.require(:category).permit(:name)
  end
end
