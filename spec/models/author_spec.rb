require 'rails_helper'

RSpec.describe Author, type: :model do

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

end
