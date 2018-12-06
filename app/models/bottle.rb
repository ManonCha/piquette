class Bottle < ApplicationRecord
  has_many :wishes
  has_many :user_bottles, dependent: :destroy
  has_many :users, through: :user_bottles
  has_many :reviews

  belongs_to :region
  belongs_to :winery
  belongs_to :color

  validates :title, presence: true
  validates :year, presence: true

  mount_uploader :photo, PhotoUploader

  scope :color, -> (color) { joins(:color).where("colors.name = ?", color) }
  scope :region, -> (region) { joins(:region).where("regions.name = ?", region) }
  scope :winery, -> (winery) { joins(:winery).where("wineries.name = ?", winery) }
  scope :of_user, -> (user) { joins(:user_bottles).where("user_bottles.user_id = ?", user.id) }
end
