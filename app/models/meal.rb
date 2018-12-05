class Meal < ApplicationRecord
  has_many :wine_pairings
  has_many :bottles,  dependent: :destroy, through: :wine_pairings

end
