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
    @products = Product.where(status: Product::ACTIVE).where(price: ActiveSupport::JSON.decode(params[:prices]).max.to_i..ActiveSupport::JSON.decode(params[:prices]).min.to_i)
    render "index"
  end

end