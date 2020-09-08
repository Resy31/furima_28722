class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :zip_code,        null: false
      t.integer :ship_address_id, null: false
      t.string  :city,            null: false
      t.string  :house_number,    null: false
      t.string  :apartment
      t.string  :phone_number,    null: false
      t.integer :purchase_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end