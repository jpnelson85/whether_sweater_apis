class Api::V1::RoadtripsController < ApplicationController
  def create 
    user = User.find_by(api_key: params[:api_key])
    if user
      trip = RoadtripFacade.get_roadtrip_details(params[:start], params[:destination])
      if trip == 'Impossible Route'
        render json: { error: 'Impossible Route', status: 400 }
      else
        destination_weather = RoadtripFacade.get_destination_weather(params[:destination], trip.travel_time)
        render json: RoadtripSerializer.serialize(trip, destination_weather, params[:start], params[:destination]), status: 201
      end
    else
      render json: { error: 'Unauthorized', status: 401 }
    end  
  end
end

