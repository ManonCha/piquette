class Winery < ApplicationRecord
  has_many :bottles, dependent: :destroy
end
