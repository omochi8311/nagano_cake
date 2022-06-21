class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_derails
  belongs_to :genre

  has_one_attached :image
end