class User < ApplicationRecord
  has_many :addresses
  has_many :payment_orders
end