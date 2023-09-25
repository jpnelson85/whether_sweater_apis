require "rails_helper"

RSpec.describe "Book Facade" do
  describe "class methods" do
    it "#city_book_search", :vcr do
    location = "denver,co"
    books = BookFacade.get_books_by_city_search(location)

    expect(books).to be_a(Array)
    expect(books[0]).to be_a(Book)
    expect(books[0].title).to be_a(String)
    expect(books[0].authors).to be_an(Array)
    expect(books[0].authors[0]).to be_a(String)
    expect(books[0].isbns).to be_an(Array)
    expect(books[0].isbns[0]).to be_a(String)
    end
  end
end