class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save!

    @cart_items = current_user.cart.cart_items
    @cart_items.each do |item|
      @product = Product.find(item.product_id)
      @order_item = OrderItem.new(order: @order, product: @product)
      @order_item.save!
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def order_params
    params.permit(:total_cost, :user)
  end

end
