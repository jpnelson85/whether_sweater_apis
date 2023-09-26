class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    trip = RoadtripFacade.get_roadtrip_details(params[:origin], params[:destination])
    if user.present? && trip.travel_time == "Impossible Route"
      render json: { error: 'Impossible Route', status: 400 }
    elsif user.nil?
      render json: { error: 'Unauthorized', status: 401 }
    else
      destination_weather = RoadtripFacade.get_roadtrip_details(params[:origin], params[:destination])
      render json: RoadtripSerializer.serialize(params[:origin], params[:destination], trip.travel_time, destination_weather), status: 201
    end  
  end
end