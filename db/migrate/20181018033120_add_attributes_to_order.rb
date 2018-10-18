class AddAttributesToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_cost, :integer
    add_reference :orders, :user, foreign_key: true
  end
end
