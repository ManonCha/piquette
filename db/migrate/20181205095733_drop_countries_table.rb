class DropCountriesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :countries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
