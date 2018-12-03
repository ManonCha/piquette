class CreateUserBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bottles do |t|
      t.references :bottle, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
