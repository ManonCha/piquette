class Bottle < ApplicationRecord
  has_many :wishes
  has_many :user_bottles, dependent: :destroy
  has_many :reviews

  belongs_to :region
  belongs_to :winery
  belongs_to :color

  validates :title, presence: true
  validates :year, presence: true

  mount_uploader :photo, PhotoUploader
end
