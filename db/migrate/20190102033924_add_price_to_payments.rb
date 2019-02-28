class AddPriceToPayments < ActiveRecord::Migration[5.2]
  def change
    add_monetize :payments, :total, currency: { present: true }
  end
end
