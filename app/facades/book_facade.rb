class BookFacade
  def self.get_books_by_city_search(location)
    books = BookService.new.city_book_search(location)
    books[:docs].map do |book|
      Book.new(book)
    end
  end
end