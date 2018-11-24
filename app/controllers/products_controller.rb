class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @cart_item = CartItem.new
  end

  def new
    @product = Product.new
  end

  def create
   @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        params[:images]['photo'].each do |a|
          @product_attachment = @product.images.create!(:photo => a, :product_id => @product.id)
        end
       format.html { redirect_to @product, notice: 'product was successfully created.' }
      else
       format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def add_to_cart
    @product = Product.find(params[:product_id]).id
    @user = current_user
    @cart_item = CartItem.new(cart_id: @user.id, product_id: @product)
    @cart_item.save!
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :available, :main_photo, images: [:id, :product_id, :media => []])
  end

end
