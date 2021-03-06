class User < ApplicationRecord
  has_one :cart
  has_many :cart_items, through: :carts
  has_many :orders

  after_create :create_cart

  def create_cart
    @cart = Cart.new(user_id: self.id)
    @cart.save!
  end

  def hide_if_no_notifications
    if self.cart.cart_items.count == 0
      'none'
    else
      'block'
    end
  end

  # DEVISE
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

end
