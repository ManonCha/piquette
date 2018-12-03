class CreateBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :bottles do |t|
      t.string :title
      t.references :region, foreign_key: true
      t.references :country, foreign_key: true
      t.references :bottle_grape, foreign_key: true
      t.references :winery, foreign_key: true
      t.references :color, foreign_key: true
      t.integer :year
      t.integer :best_before
      t.integer :best_after

      t.timestamps
    end
  end
end
