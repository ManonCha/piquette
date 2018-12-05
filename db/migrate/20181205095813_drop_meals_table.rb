class DropMealsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :meals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
