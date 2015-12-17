require 'rails_helper'

RSpec.describe BookFormat, type: :model do
  before do
    @format = BookFormat.new book_id: 1, book_format_type_id: 2
  end

  it 'requires a book_id' do
    @format.book_id = nil
    be_false @format.valid?
  end

  it 'requires a book_format_id' do
    @format.book_format_type_id = nil
    be_false @format.valid?
  end
end
