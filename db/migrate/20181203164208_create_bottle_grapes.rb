class CreateBottleGrapes < ActiveRecord::Migration[5.2]
  def change
    create_table :bottle_grapes do |t|
      t.references :grape, foreign_key: true

      t.timestamps
    end
  end
end
