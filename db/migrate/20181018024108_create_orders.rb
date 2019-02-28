class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.integer :producer_id
      t.integer :product_id
      t.string :status
      t.timestamps
    end
  end
end
