class CreateProducts < ActiveRecord::Migration[5.2]
  def change

    create_table :products do |t|

      t.string :name
      t.text :description

      t.boolean :available, default: true
      t.boolean :featured, default: false

      t.timestamps

    end
  end
end
