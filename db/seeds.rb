# 1 - 2  minutes 2.8 GHz Intel Core i7

@messages = []

def create_message klass
  @messages << "#{ klass.count } #{klass.name}'s created"
end

def show_messages
  puts '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
  @messages.each { |m| puts m }
  puts '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
end

def rand_name
  ('a'..'z').to_a.shuffle[0,8].join
end

def rand_record klass
  klass.offset(rand(klass.count)).first
end

def transaction &block
  ActiveRecord::Base.transaction do
    block.call
  end
end

def formats
  {
    kindle: false,
    nook: false,
    pdf: false,
    quarto: true,
    hardcover: true,
    softcover: true,
    puzzle: true,
    popup: true,
    e_book: false,
    audiobook: false
  }
end

# Format types ~ 10
def create_format_types
  formats.each { |type, state| BookFormatType.create name: type, physical: state } 
  create_message BookFormatType
end

# Publishers ~ 100
def create_publishers
  transaction { 100.times { Publisher.create name: rand_name } }
  create_message Publisher
end

# Author ~ 100_000 / 1000
def create_authors
  transaction { 100.times { Author.create first_name: rand_name, last_name: rand_name } }
  create_message Author
end

# Books ~ 150_000 / 1000
def create_books
  transaction {
    150.times do
      Book.create(
        title: rand_name,
        author: rand_record(Author),
        publisher: rand_record(Publisher)
      )
    end
  }
  create_message Book
end

def create_formats 
  transaction {
    Book.all.each { |book| create_each_format book }
  }
  create_message BookFormat
end

def create_each_format book
  BookFormat.create(
    book: book,
    book_format_type: rand_record(BookFormatType)
  )
end

# Reviews ~ 15000
def create_reviews
  transaction {
    Book.all.each do |book|
      lots_of_reviews book 
    end
  }
  create_message BookReview
end

def lots_of_reviews book
  transaction {
    100.times { BookReview.create book: book, rating: rand(1..5) }
  }
end

create_format_types
create_publishers
create_authors
create_books
create_formats
create_reviews
show_messages
