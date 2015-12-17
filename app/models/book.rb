class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  has_many :book_reviews

  def author_name
    author_first_name + ' ' + author_last_name
  end

  def author_first_name
    self.author.first_name.capitalize
  end

  def author_last_name
    self.author.last_name.capitalize
  end
end
