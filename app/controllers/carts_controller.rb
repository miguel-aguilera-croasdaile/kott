class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items

    @order = Order.new
  end

end
