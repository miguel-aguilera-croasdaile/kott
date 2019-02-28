class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    @cart_items = current_user.cart.cart_items
    @cart_items.each do |cart_item|

      @order_item = OrderItem.new(
        order: @order,
        product: cart_item.product,
        name: cart_item.product.name ,
        price_cents: cart_item.product.price_cents,
        size: cart_item.size,
        quantity: cart_item.quantity
        )
      @order_item.save!
    end
    @order.status = "Awaiting Payment"
    redirect_to new_orders_payment_path(@order)
  end

  private

  def order_params
    params.permit(:user)
  end

end
