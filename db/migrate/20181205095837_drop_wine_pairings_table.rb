class DropWinePairingsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :wine_pairings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
