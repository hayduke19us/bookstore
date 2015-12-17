class BookFormatType < ActiveRecord::Base
  validates :name, :physical, presence: true

  has_many :book_formats
  has_many :books, through: :book_format_types
end
