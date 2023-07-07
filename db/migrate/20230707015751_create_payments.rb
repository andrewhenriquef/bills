class CreatePayments < ActiveRecord::Migration[7.0]
  def up
    create_table :payments do |t|
      t.decimal :value
      t.datetime :paid_at

      t.timestamps
    end

    add_reference :payments, :user, foreign_key: true
  end

  def down
    drop_table :payments
  end
end
