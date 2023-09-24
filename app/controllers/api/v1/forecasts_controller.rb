class Api::V1::ForecastsController < ApplicationController
  def index
    if params[:location].nil? || params[:location].empty?
      render json: { error: 'Location cannot be blank' }, status: :bad_request
    else
      all_weather = ForecastFacade.get_forecast(params[:location])
      render json: ForecastSerializer.new.forecast_data(all_weather[0], all_weather[1], all_weather[2])
    end
  end
end