require "rails_helper"

RSpec.describe "Book Search" do
  it "can search for books by city", :vcr do
    location = "denver,co"
    get "/api/v1/book-search?location=#{location}&quantity=5"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
    expect(books).to be_a(Array)
    expect(books[0]).to be_a(Book)
    expect(books[0].title).to be_a(String)
    expect(books[0].authors).to be_an(Array)
    expect(books[0].authors[0]).to be_a(String)
    expect(books[0].isbns).to be_an(Array)
    expect(books[0].isbns[0]).to be_a(String)
  end
end