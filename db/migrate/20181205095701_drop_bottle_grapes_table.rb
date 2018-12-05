class DropBottleGrapesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :bottle_grapes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
