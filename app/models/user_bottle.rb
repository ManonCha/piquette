class UserBottle < ApplicationRecord
  belongs_to :bottle
  belongs_to :user

  validates :quantity, presence: true

end
