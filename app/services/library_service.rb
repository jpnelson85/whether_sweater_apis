class LibraryService
  def conn
    Faraday.new(url: "http://openlibrary.org")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def city_book_search(location)
    get_url("/search.json?#{location}&quantity=5")
  end
end