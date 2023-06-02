class Cart < ApplicationRecord
  belongs_to :user 
  belongs_to :store 
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  validates :user_id, presence: true
  validates :store_id, presence: true 
  has_one :order
  enum status: { active: 0, completed: 1 }
end
