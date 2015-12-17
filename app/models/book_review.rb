class BookReview < ActiveRecord::Base
  validates :book_id, :rating, presence: true
end
