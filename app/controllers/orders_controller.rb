class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

 def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    if @order.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  private

   private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :phone)
  end

end
