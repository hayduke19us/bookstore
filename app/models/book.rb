class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  has_many :book_reviews

  def self.search query, options: default_options
    query = query.downcase
    joins(:author).
    where("lower(authors.first_name) = ? OR lower(authors.last_name) = ?
          OR lower(books.title) LIKE ?", query, query, "%#{query}%").
    uniq.
    sort_by(&:average_rating).reverse!
  end

  def author_name
    author_first_name + ' ' + author_last_name
  end

  def author_first_name
    author.first_name.capitalize
  end

  def author_last_name
    author.last_name.capitalize
  end

  def average_rating
    (ratings_sum / book_reviews.count).round(1)
  end

  def ratings_sum
    self.book_reviews.pluck(:rating).sum
  end

  private
  def self.default_options
    {title_only: false}
  end

end
