class CreateWinePairings < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_pairings do |t|
      t.references :bottle, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
