class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats
end
