class OrdersController < ApplicationController

  def index
    if current_user.is_admin?
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = 0

    @cart_items = current_user.cart.cart_items
    @cart_items.each do |cart_item|

      @order_item = OrderItem.new(
        order: @order,
        product: cart_item.product,
        name: cart_item.product.name ,
        price: cart_item.product.price,
        size: cart_item.size,
        quantity: cart_item.quantity
        )
      @order_item.save!
      @order.total = @order.total + (cart_item.product.price.to_i * cart_item.quantity.to_i)
    end

    if @order.save
      sweetalert('Your order has been placed', 'Success!', persistent: true, icon: "success")
      redirect_to user_cart_path(current_user)
    else
      sweetalert('Something went wrong. Please try again', 'Error!', persistent: true, icon: "error")
      redirect_to cart_path
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
    params.permit(:user)
  end

end
