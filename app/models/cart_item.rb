class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :size, presence: true
  validates :quantity, presence: true

  after_create :add_to_cart_total

  def add_to_cart_total
    @cart = self.cart

    p "BEFORE"

    p @cart.total

    p "DIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDERDIVIDER"

    @cart.update_attribute(:total, @cart.total + self.price.to_f)

    p "AFTER"

    p @cart.total

  end

end
