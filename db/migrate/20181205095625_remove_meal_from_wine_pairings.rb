class RemoveMealFromWinePairings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :wine_pairings, :meal, foreign_key: true
  end
end
