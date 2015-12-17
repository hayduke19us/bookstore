class Book < ActiveRecord::Base
  validates :title, :publisher_id, :author_id, presence: true
end
