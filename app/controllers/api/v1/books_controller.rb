class Api::V1::BooksController < ApplicationController
  def index
    books = BookFacade.get_books_by_city_search(params[:location], params[:quantity])
    weather = ForecastFacade.get_forecast(params[:location])
    total_books_found = BookFacade.total_books_found(params[:location], params[:quantity])
    render json: CityBookSerializer.serialize(books, weather, params[:location], total_books_found)
  end
end