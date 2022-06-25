class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_derails
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1, production: 2, preparing: 3, shipping: 4}
end
