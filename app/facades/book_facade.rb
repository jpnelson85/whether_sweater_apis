class BookFacade
  def self.get_books_by_city_search(location, quantity)
    books = BookService.new.city_book_search(location, quantity)
    books[:docs].map do |book|
      Book.new(book)
    end
  end

  def self.total_books_found(location, quantity)
    books = BookService.new.city_book_search(location, quantity)
    books[:numFound]
  end
end