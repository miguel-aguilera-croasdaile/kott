class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index

    @products = Product.all

  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new  # <-- You need this now.
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :available, :content)
  end
end
