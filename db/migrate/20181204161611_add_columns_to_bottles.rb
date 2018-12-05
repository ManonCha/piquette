class AddColumnsToBottles < ActiveRecord::Migration[5.2]
  def change
    add_column :bottles, :grapes, :string
    add_column :bottles, :bio, :boolean, default: false
    add_column :bottles, :designation, :string
    add_column :bottles, :terroir, :string
    add_column :bottles, :harvest, :string
    add_column :bottles, :viticulture, :string
    add_column :bottles, :winemaking, :string
    add_column :bottles, :alcool, :string
    add_column :bottles, :nose, :string
    add_column :bottles, :appearance, :string
    add_column :bottles, :taste, :string
    add_column :bottles, :tasting_advice, :string
    add_column :bottles, :wine_pairing, :string
    add_column :bottles, :price, :integer
  end
end
