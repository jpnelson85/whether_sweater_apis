require "rails_helper"

RSpec.describe "Book Service" do
  it "can get book data", :vcr do
    search = "Normal People"
    books = BookService.new.city_book_search(search)

    expect(books).to be_a(Hash)
    expect(books).to have_key(:docs)
    expect(books[:docs]).to be_an(Array)
    expect(books[:docs][0]).to be_a(Hash)
    expect(books[:docs][0]).to have_key(:title)
    expect(books[:docs][0][:title]).to be_a(String)
    expect(books[:docs][0]).to have_key(:author_name)
    expect(books[:docs][0][:author_name]).to be_an(Array)
    expect(books[:docs][0][:author_name][0]).to be_a(String)
    expect(books[:docs][0]).to have_key(:publisher)
    expect(books[:docs][0][:publisher]).to be_an(Array)
    expect(books[:docs][0][:publisher][0]).to be_a(String)
    expect(books[:docs][0]).to have_key(:isbn)
    expect(books[:docs][0][:isbn]).to be_an(Array)
    expect(books[:docs][0][:isbn][0]).to be_a(String)
  end
end