class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  belongs_to :category 
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
