class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: BooksSerializer.serialize(books)
  end
end