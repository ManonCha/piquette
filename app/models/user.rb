class User < ApplicationRecord
  has_many :user_bottles
  has_many :reviews
  has_many :wishes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
