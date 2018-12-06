class User < ApplicationRecord
  has_many :user_bottles, dependent: :destroy
  has_many :bottles, through: :user_bottles
  has_many :reviews, dependent: :destroy
  has_many :wishes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # after_create :send_welcome_email


  private
  # def send_prevent_email
  #   UserMailer.prevent(self).deliver_now

  # end

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  # end
end
