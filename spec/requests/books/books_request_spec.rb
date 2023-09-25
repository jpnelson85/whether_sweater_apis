require "rails_helper"

RSpec.describe "Book Search" do
  it "can search for books by city and show weather", :vcr do
    location = "denver,co"
    number_of_books = 5
    get "/api/v1/book-search?location=#{location}&quantity=#{number_of_books}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:data)
    expect(results[:data]).to be_a(Hash)
    expect(results[:data]).to have_key(:id)
    expect(results[:data][:id]).to eq("null")
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:type]).to eq("books")
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to be_a(Hash)
    expect(results[:data][:attributes]).to have_key(:destination)
    expect(results[:data][:attributes][:destination]).to be_a(String)
    expect(results[:data][:attributes]).to have_key(:forecast)
    expect(results[:data][:attributes][:forecast]).to be_a(Hash)
    expect(results[:data][:attributes][:forecast]).to have_key(:summary)
    expect(results[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(results[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(results[:data][:attributes][:forecast][:temperature]).to be_a(Float)
    expect(results[:data][:attributes]).to have_key(:total_books_found)
    expect(results[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(results[:data][:attributes]).to have_key(:books)
    expect(results[:data][:attributes][:books]).to be_an(Array)
    expect(results[:data][:attributes][:books].count).to eq(5)
    expect(results[:data][:attributes][:books][0]).to be_a(Hash)
    expect(results[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(results[:data][:attributes][:books][0][:isbn]).to be_a(Array)
    expect(results[:data][:attributes][:books][0]).to have_key(:title)
    expect(results[:data][:attributes][:books][0][:title]).to be_a(String)
  end
end