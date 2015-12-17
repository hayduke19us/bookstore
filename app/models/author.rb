class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :books

  scope :by_first_name, -> (query) { where "lower(first_name) = ?", query.downcase }
  scope :by_last_name, -> (query) { where "lower(last_name) = ?", query.downcase }

end
