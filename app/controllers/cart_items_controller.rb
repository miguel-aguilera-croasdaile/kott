class CartItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.product = @product
    @cart_item.price = @product.price
    @cart_item.cart = current_user.cart
    @cart_item.save!
    if @cart_item.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.cart = current_user.cart
  #   @cart_item.product = params[:cart_item][:product]
  #   @cart_item.save!
  # end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user), :notice => "Your cart_item has been deleted"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:size, :quantity)
  end

end
