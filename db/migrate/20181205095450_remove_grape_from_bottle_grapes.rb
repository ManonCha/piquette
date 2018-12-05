class RemoveGrapeFromBottleGrapes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bottle_grapes, :grape, foreign_key: true
  end
end
