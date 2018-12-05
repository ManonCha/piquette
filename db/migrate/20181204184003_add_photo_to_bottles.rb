class AddPhotoToBottles < ActiveRecord::Migration[5.2]
  def change
    add_column :bottles, :photo, :string
  end
end
