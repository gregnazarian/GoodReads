class AddBooksToBookshelf < ActiveRecord::Migration[6.0]
  def change
    add_column :bookshelves, :books, :string

  end
end
