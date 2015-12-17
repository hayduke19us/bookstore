class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.integer :book_id
      t.integer :rating, null: false

      t.timestamps null: false
    end
  end
end
