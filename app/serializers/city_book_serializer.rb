class CityBookSerializer
  def self.serialize(books, weather, location, total_books_found)
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: location,
          forecast: { summary: weather[0].condition_text,
                      temperature: weather[0].temp_f
                    },
          total_books_found: total_books_found,
          books: books.map do |book|
                  { isbn: book.isbn,
                    title: book.title }
              end
        }
      }
    }
  end
end