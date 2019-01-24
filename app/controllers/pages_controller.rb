class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @featured = Product.where(featured: true)
  end

  def checkout

  end
end
