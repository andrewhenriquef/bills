class CreatePaymentOrders < ActiveRecord::Migration[7.0]
  def up
    create_table :payment_orders do |t|
      t.decimal :value, precision: 10, scale: 2, null: false
      t.integer :kind
      t.datetime :expires_at, null: false

      t.timestamps
    end

    add_reference :payment_orders, :user, foreign_key: true
    add_reference :payment_orders, :companies, foreign_key: true
    add_reference :payment_orders, :address, foreign_key: true
    add_reference :payment_orders, :payments, foreign_key: true
  end

  def down
    drop_table :payment_orders
  end
end
