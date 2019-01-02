class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.string :name
      t.string :size
      t.string :color
      t.string :price
      t.integer :quantity
      t.timestamps
    end
  end
end
