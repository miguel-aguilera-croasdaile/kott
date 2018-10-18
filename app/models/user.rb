class User < ApplicationRecord
  has_one :cart
  has_many :cart_items, through: :carts
  has_many :orders

  after_create :create_cart

  def create_cart
    cart = Cart.new(user_id: self.id)
    cart.save!
  end

  # DEVISE
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

end
