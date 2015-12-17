class CreateBookFormats < ActiveRecord::Migration
  def change
    create_table :book_formats do |t|
      t.references :book
      t.references :book_format_type

      t.timestamps null: false
    end
  end
end
