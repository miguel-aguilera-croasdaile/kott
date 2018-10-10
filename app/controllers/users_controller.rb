class UsersController < ApplicationController
  before_action :set_user

  def show
    @cart_items = @user.cart_items
  end

  private

  def set_user
    @user = current_user
  end
end
