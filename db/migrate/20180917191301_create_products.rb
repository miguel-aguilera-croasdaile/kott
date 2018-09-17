class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.boolean :available

      t.timestamps
    end
  end
end
