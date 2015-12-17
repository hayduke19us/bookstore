require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = Book.new title: 'Franny and Zooey', publisher_id: 1, author_id: 2 
  end

  it 'requires a title' do
    @book.title = nil
    be_false @book.valid?
  end

  it 'requires a title' do
    @book.publisher_id = nil
    be_false @book.valid?
  end

  it 'requires an author_id' do
    @book.author_id = nil
    be_false @book.valid?
  end

end
