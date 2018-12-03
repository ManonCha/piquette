class UserBottle < ApplicationRecord
  belongs_to :bottle
  belongs_to :user

  validate :quantity, presence: true
end
