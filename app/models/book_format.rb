class BookFormat < ActiveRecord::Base
  validates :book_id, :book_format_type_id, presence: true

  belongs_to :book
  belongs_to :book_format_type
end
