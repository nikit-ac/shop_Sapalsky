class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:images)
  end

  def show
    @product = Product.find(params[:id])
  end



end