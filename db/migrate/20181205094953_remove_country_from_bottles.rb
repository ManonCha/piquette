class RemoveCountryFromBottles < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bottles, :country, foreign_key: true
  end
end
