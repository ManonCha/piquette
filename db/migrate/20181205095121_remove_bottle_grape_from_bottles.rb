class RemoveBottleGrapeFromBottles < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bottles, :bottle_grape, foreign_key: true
  end
end
