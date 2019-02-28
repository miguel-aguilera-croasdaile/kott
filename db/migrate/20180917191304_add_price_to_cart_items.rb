class AddPriceToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_monetize :cart_items, :price, currency: { present: true }
  end
end
