class Book
  attr_reader :title,
              :author,
              :isbn,
              :total_books_found

  def initialize(data)
    @title = data[:title]
    @author = data[:author_name]
    @isbn = data[:isbn]
    @total_books_found = 0
  end

  def total_books_found(location, quantity)
    books = BookService.new.city_book_search( location, quantity)
    @total_books_found = books[:numFound]
  end

end