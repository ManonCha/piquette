class Bottle < ApplicationRecord
  has_many :wishes
  has_many :user_bottles
  has_many :reviews
  # has_many :meals, through: :wine_pairings
  # has_many :grapes, through: :bottle_grapes

  belongs_to :region
  # belongs_to :country
  belongs_to :winery
  belongs_to :color

  validates :title, presence: true
  validates :year, presence: true

  mount_uploader :photo, PhotoUploader
end
