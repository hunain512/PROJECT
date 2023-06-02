class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :store 
  has_many :items, dependent: :destroy
end
