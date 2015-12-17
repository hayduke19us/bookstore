require 'rails_helper'

RSpec.describe Publisher, type: :model do

  before do
    @publisher = Publisher.new name: 'little brown, and company'
  end

  it 'requires a name' do
    @publisher.name = nil
    be_false @publisher
  end

end
