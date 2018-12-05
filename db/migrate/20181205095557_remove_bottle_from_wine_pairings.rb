class RemoveBottleFromWinePairings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :wine_pairings, :bottle, foreign_key: true
  end
end
