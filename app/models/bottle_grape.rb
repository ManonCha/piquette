class BottleGrape < ApplicationRecord
  belongs_to :grape
  has_many :bottles
end
