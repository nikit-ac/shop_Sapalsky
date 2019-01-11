class ProductsController < ApplicationController

  def index
    @products = Product.where(status: Product::ACTIVE).includes(:images)
  end

  def show
    @product = Product.find(params[:id])
  end

  def tag
    @products = Product.where(status: Product::ACTIVE).tagged_with(params[:name])
    render "index"
  end

  def range
    range = ActiveSupport::JSON.decode(params[:prices]).collect {|i| i.to_i}
    @products = Product.where(status: Product::ACTIVE).where(price: range.min..range.max)
    render "index"
  end

end