class BookFormat < ActiveRecord::Base
  validates :book_id, :book_format_type_id, presence: true
end
