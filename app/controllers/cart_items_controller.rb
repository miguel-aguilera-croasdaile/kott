class CartItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.product = @product
    @cart_item.price = @product.price
    @cart_item.name = @product.name
    @cart_item.cart = current_user.cart

    if @cart_item.save
      sweetalert('Your product offer has successfully been created', 'Success!', persistent: true, icon: "success")
      redirect_to product_path(@product)
    else
      sweetalert('Something went wrong. Please try again', 'Error!', persistent: true, icon: "error")
      redirect_to product_path(@product)
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user), :notice => "Your cart_item has been deleted"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:size, :quantity, :color)
  end

end
