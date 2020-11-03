class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcode_id, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :housenumber, null: false
      t.string :building
      t.string :phonenumber, null: false
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
