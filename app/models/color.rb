class Color < ApplicationRecord
  has_many :bottles, dependent: :destroy
end
