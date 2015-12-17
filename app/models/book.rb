class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true

  belongs_to :publisher
  belongs_to :author

  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  has_many :book_reviews

  scope :by_title, -> (query) { where "lower(title) LIKE ?", "%#{query.downcase}%" }

  def self.search query, options: default_options
    begin
      raise if query
    end
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
    (ratings_sum / number_of_reviews).round(1)
  end

  def ratings_sum
    self.book_reviews.pluck(:rating).sum
  end

  def number_of_reviews
    book_reviews.count
  end

  private

  def default_options
    {title_only: false}
  end

end
