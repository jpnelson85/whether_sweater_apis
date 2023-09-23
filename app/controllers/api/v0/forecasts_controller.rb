class Api::V0::ForecastsController < ApplicationController
  def index
    all_weather = ForecastFacade.get_forecast(params[:location])
    render json: ForecastSerializer.new.forecast_data(all_weather[0], all_weather[1], all_weather[2])
  end
end