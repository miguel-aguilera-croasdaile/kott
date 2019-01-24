class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

      t.float :total, default: 0;
      t.timestamps
    end
  end
end
