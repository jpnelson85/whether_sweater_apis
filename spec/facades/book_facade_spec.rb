require "rails_helper"

RSpec.describe "Book Facade" do
  describe "class methods" do
    it "#city_book_search", :vcr do
    location = "denver,co"
    quantity = 5
    books = BookFacade.get_books_by_city_search(location, quantity)

    expect(books).to be_a(Array)
    expect(books[0]).to be_a(Book)
    expect(books[0].title).to be_a(String)
    expect(books[0].author).to be_an(Array)
    expect(books[0].author[0]).to be_a(String)
    expect(books[0].isbn).to be_an(Array)
    expect(books[0].isbn[0]).to be_a(String)
    end
  end
end