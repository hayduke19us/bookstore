class BookFormatType < ActiveRecord::Base
  validates :name, :physical, presence: true
end
