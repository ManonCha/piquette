class AddTastingDateToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :tasting_date, :date
  end
end
