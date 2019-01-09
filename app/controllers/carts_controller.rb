class CartsController < ApplicationController

  def show
    @cart = Cart.where(user: current_user)[0]
    @cart_items = @cart.cart_items
    @cart_total = 0
    @cart_items.each do |cart_item|
      cart_item.quantity.to_i.times do
        @cart_total = @cart_total + (cart_item.price.to_i)
      end
    end
    @order = Order.new
  end

end
