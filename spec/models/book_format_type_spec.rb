require 'rails_helper'

RSpec.describe BookFormatType, type: :model do

  before do
    @format = BookFormatType.new name: 'paperback', physical: true
  end

  it 'requires a name' do
    @format.name = nil
    be_false @format.valid?
  end

  it 'requires a physical' do
    @format.physical = nil
    be_false @format.valid?
  end

end
