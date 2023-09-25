require "rails_helper"

RSpec.describe "Book Poro" do
  it "can create a book poro", :vcr do
    book_data = {   "isbn": ["9780316420236"],
                    "title": "Normal People",
                    "author_name": ["Sally Rooney"]}

    book = Book.new(book_data)

    expect(book).to be_a(Book)
    expect(book.title).to be_a(String)
    expect(book.author).to be_an(Array)
    expect(book.isbn).to be_an(Array)
  end

  it "can get total books found", :vcr do
    book_data = {   "isbn": ["9780316420236"],
                    "title": "Normal People",
                    "author_name": ["Sally Rooney"]}

    book = Book.new(book_data)
    expect(book.total_books_found("denver,co", 5)).to be_an(Integer)
  end
end