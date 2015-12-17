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

  it 'returns authors by first name exact match, not case sensitive' do
    authors = Author.by_first_name "JEROMe"
    expect(authors.first.first_name).to match(/jer/)

    authors = Author.by_first_name "JEROne"
    be_false authors.any?
  end

  it 'returns authors by last name exact match, not case sensitive' do
    authors = Author.by_last_name "SalInger"
    expect(authors.first.last_name).to match(/sal/)

    authors = Author.by_last_name "SalInge"
    be_false authors.any?
  end

end
