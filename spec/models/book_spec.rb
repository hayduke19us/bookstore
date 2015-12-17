require 'rails_helper'

RSpec.describe Book, type: :model do
  fixtures :books
  fixtures :authors
  fixtures :publishers

  before do
    @book = Book.first
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
    byebug
    expect(@book.publisher.name).to eq('little brown and company')
  end

  it 'has an author' do
    expect(@book.author.first_name).to eq('jerome')
  end

end
