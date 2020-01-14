class AddReviewToBooks < ActiveRecord::Migration[6.0]
  def change
      add_column :books, :reviews, :text
  end
end
