class Api::V1::RoadtripsController < ApplicationController
  def create 
    # require 'pry'; binding.pry
    user = User.find_by(api_key: params[:api_key])
    trip = RoadtripFacade.get_roadtrip_details(params[:start], params[:destination])

    if user.present? && trip == 'Impossible Route'
      render json: { error: 'Impossible Route', status: 400 }
    elsif user.nil?
      render json: { error: 'Unauthorized', status: 401 }
    else
      arrival_trip = RoadtripFacade.get_roadtrip_details(params[:origin], params[:destination])
      destination_weather = RoadtripFacade.get_roadtrip_details(params[:destination], trip.travel_time)
      render json: RoadtripSerializer.serialize(params[:origin], params[:destination], arrival_trip.travel_time, destination_weather.weather_at_destination), status: 201
    end  
  end
end