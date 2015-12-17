require 'rails_helper'

RSpec.describe BookReview, type: :model do
  before do
    @review = BookReview.new book_id: 1, rating: 1
  end

  it 'requires a book_id' do
    @review.book_id = nil
    be_false @review.valid?
  end

  it 'requires a book_id' do
    @review.rating = nil
    be_false @review.valid?
  end

end
