class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @order = @product.orders.build
  end

  def create
    @order = Order.create(order_params)
    # @order.send_simple_message(order_params, request.host)
  end

  def order_params
    params.require(:order).permit(:name, :phone, :email, :delivery_info, :product_id, :tag_list)
  end

end