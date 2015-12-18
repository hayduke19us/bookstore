## Readme
Welcome to Bookstore! 

The general architecture is simple. Publishers and Authors have Books. Books
have BookFormatTypes through BookFormats and Books also have Reviews. 

#### Getting Started 

**Clone The Repo** 

				git clone https::/github.com/hayduke19us/bookstore

**Dependencies** 

				bundle exec install

**Create The Database and run the migrations**

				rake db:setup

**Development Resources**

				rake db:seed 

This will create:

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

* 10  BookFormatType's created

* 100 Publisher's created

* 100 Author's created

* 150 Book's created

* 150 BookFormat's created

* 15000 BookReview's created 
	
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

**Run The Tests**

				bundle exec rake 

**Searching For Books**

Book has a class method for searching that takes one argument and up to three
options. 
				
```ruby

# Default opts

{title_only: false, book_format_type_id: nil book_format_type_physical: nil}

Book.search "Jerome", options: {}

```

* If title only is true it will return the results from the query only! The
	results are sorted by the book's review average. 

* If book_format_type_id is given an id it will return only the books that have
	a matching BookFormat.

* If format_type_physical is true it returns only the books that have a physical
	format.

** Author name**

```ruby 

# Returns the authers full name first and last.

@book.author_name

```

**Average Rating**

```ruby

# Returns the books average rating rounded to the first decimal

@book.average_rating

```

**Book Format Types***


``` ruby 

# Returns the books format types, 'kindle', 'audiobook' ect.

@book.book_format_types

```
