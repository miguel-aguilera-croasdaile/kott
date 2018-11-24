class AddMainPhotoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :main_photo, :string
  end
end
