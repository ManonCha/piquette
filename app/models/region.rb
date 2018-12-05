class Region < ApplicationRecord
  has_many :bottles, dependent: :destroy
end
