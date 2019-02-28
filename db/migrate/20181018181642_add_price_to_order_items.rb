class AddPriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_monetize :order_items, :price, currency: { present: true }
  end
end
