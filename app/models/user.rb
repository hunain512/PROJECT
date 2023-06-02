class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :user_stores, dependent: :destroy
         has_many :stores, through: :user_stores 
         validates :email, presence: true
         validates :password, presence: true
         has_many :carts, dependent: :destroy
         has_many :orders, dependent: :destroy
end
