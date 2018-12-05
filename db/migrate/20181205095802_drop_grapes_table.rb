class DropGrapesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :grapes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
