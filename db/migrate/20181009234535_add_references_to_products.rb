class AddReferencesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :cart, foreign_key: true
  end
end
