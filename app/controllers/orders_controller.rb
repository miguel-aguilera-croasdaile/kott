class OrdersController < ApplicationController
  def new
    #Initialize total cost variable
    @total_cost = 0

    #Iterate over all items in cart to calculate total cost
    @items = current_user.cart.cart_items
    @items.each do |item|
      @product = Product.find(item.product_id)
      @total_cost += @product.price.to_i
    end

    #Declare new order
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save!
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
