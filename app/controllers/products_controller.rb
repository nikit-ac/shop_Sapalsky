class ProductsController < ApplicationController

  before_action :default_page, only: [:index, :tag, :category]

  def index
    @products = Product.where(status: Product::ACTIVE).includes(:images).paginate(:page => params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def tag
    @products = Product.where(status: Product::ACTIVE).tagged_with(params[:name]).paginate(:page => params[:page])
    render "index"
  end

  def category
    @products = Product.where(status: Product::ACTIVE, category: params[:name]).paginate(:page => params[:page])
    render "index"
  end

  def range
    range = ActiveSupport::JSON.decode(params[:prices]).collect {|i| i.to_i}
    @products = Product.where(status: Product::ACTIVE).where(price: range.min..range.max)
    render "index"
  end

  private

  def default_page
    params[:page] = 1 if params[:page].nil?
  end

end