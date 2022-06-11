class Item < ApplicationRecord
  has_many :crat_items
  has_many :order_derails
  belongs_to :genre
end
