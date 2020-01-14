class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :rating
      t.string :shelf
      t.text :review
      t.date :date_added

      t.timestamps
    end
    add_index :books, :title, unique: true
  
  end
end
