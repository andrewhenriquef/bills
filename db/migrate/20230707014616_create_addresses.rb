class CreateAddresses < ActiveRecord::Migration[7.0]
  def up
    create_table :addresses do |t|
      t.string :number, null: false
      t.string :zip_code, null: false

      t.timestamps
    end

    add_reference :addresses, :user, foreign_key: true
  end

  def down
    drop_table :addresses
  end
end
