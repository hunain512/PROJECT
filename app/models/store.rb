class Store < ApplicationRecord
  validates :name, presence: true
  has_many :categories, dependent: :destroy
  has_many :user_stores
  has_many :users, through: :user_stores 
  has_many :carts 
  has_many :orders
end
