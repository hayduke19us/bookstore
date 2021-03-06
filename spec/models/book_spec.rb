require 'rails_helper'

RSpec.describe Book, type: :model do
  fixtures :all

  before do
    @book = books(:franny_and_zooey)
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

  it 'has a publisher' do
    expect(@book.publisher.name).to eq('little brown and company')
  end

  it 'has an author' do
    expect(@book.author.first_name).to eq('jerome')
  end

  it 'can have many reviews' do
    be_true @book.book_reviews.any?
  end

  it 'has many book_formats serving as a join model' do
    be_true @book.book_formats.any?
  end

  it 'can have many formats' do
    be_true @book.book_format_types.any?
  end

  it 'returns the authors full name' do
    expect(@book.author_name).to eq('Jerome Salinger')
  end

  it 'returns an average review ratings rounded to one decimal place' do
    expect(@book.average_rating).to eq(3.0)
  end

  it 'returns books based off either title, or author name and sorts by rating' do
    books = Book.search('Jerome')
    expect(books.first.title).to eq('hardboiled soldier')
  end

  it 'returns nothing if the query is empty' do
    be_false Book.search('').any?
  end

  it 'scopes the found books by book_format_type_id' do
    id = book_format_types(:hardcover)
    books = Book.search('Jerome', options: { book_format_type_id: id })
    expect(books.first.title).to eq('franny and zooey')
  end

  it 'scopes the found books by book_format_physical = true' do
    books = Book.search('Jerome', options: { book_format_physical: true })
    expect(books.first.title).to eq('franny and zooey')
  end

  it 'immediately returns books by title if title_only is true' do
    books = Book.search('Jerome', options: { title_only: true })
    expect(books.first.title).to eq('hardboiled soldier')
  end

end
