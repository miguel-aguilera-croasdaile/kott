class AddCartsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :carts, :text, array: true, default: []
  end
end
