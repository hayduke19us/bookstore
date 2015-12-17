class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :books

  scope :by_first_name, -> (query) { where "first_name ~* ?", query }
  scope :by_last_name, -> (query) { where "last_name ~* ?", query }

end
