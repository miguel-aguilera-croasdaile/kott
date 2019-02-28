class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user
      t.references :order

      t.string :billing_email
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_full_name
      t.string :billing_address
      t.string :billing_city
      t.string :billing_country
      t.string :billing_zip_code
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
