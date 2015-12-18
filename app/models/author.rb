class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  has_many :books

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
