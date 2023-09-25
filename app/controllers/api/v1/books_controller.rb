class Api::V1::BooksController < ApplicationController
  def index
    books = BookFacade.get_books_by_city_search(params[:location])
    weather = ForecastFacade.get_forecast(params[:location])
    render json: CityBookSerializer.serialize(books, weather)
  end
end