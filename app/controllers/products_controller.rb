class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all

    if current_user.is_admin?
      render 'products/admin/index'
    else
      @cart_item = CartItem.new
      render 'products/user/index'
    end
  end

  def show
    if current_user.is_admin?
      render 'products/admin/show'
    else
      @cart_item = CartItem.new
      render 'products/user/show'
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save!
      unless params[:images] == nil
        params[:images]['photo'].each do |a|
          @product_attachment = @product.images.create!(:photo => a, :product_id => @product.id)
        end
      end
      sweetalert('Product successfully created', 'Success!', persistent: true, icon: "success")
      redirect_to @product
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
    params.require(:product).permit(:name, :price, :description, :available, :main_photo, images: [:id, :product_id, :media => []])
  end

end
