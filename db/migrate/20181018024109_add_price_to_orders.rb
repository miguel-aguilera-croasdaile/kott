class AddPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :total, currency: { present: true }
  end
end
