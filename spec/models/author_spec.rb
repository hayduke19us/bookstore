require 'rails_helper'

RSpec.describe Author, type: :model do
  fixtures :authors

  before do
    @author = Author.new first_name: 'Jerome', last_name: 'Salinger'
  end

  it 'requires a first_name' do
    @author.first_name = nil
    be_false @author.valid?
  end

  it 'requires a last_name' do
    @author.last_name = nil
    be_false @author.valid?
  end

  it 'returns authors by first name, not case sensitive' do
    authors = Author.by_first_name "jEr"
    expect(authors.first.first_name).to match(/jer/)
  end

  it 'returns authors by last name, not case sensitive' do
    byebug
    authors = Author.by_last_name "Sal"
    expect(authors.first.last_name).to match(/sal/)
  end

end
