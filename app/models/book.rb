class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true
  validates :title, uniqueness: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  has_many :book_reviews

  def self.search query, options: default_options
    books = search_all query.downcase

    return books.sort_by(&:average_rating).reverse! if options[:title_only]

    if options[:book_format_type_id]

      books = books.joins(:book_format_types)
        .where("book_format_types.id = ?", options[:book_format_type_id])

    elsif options[:book_format_physical]

      books = books.joins(:book_format_types)
        .where("book_format_types.physical = true")

    end

    books.sort_by(&:average_rating).reverse!
  end

  def self.search_all query
    joins(:author)
    .where("lower(authors.first_name) = ? OR lower(authors.last_name) = ?
             OR lower(books.title) LIKE ?", query, query, "%#{query}%")
    .uniq!
  end

  def author_name
    author.full_name
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
