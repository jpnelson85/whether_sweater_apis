require "rails_helper"

RSpec.describe "Roadtrip Index" do
  before :each do
    @user = User.new(email: "jeff@jeff.com", password: "password", password_confirmation: "password")
  end
  it "can return roadtrip data", :vcr do
    valid_data = {  "origin": "New York,NY",
                    "destination": "Los Angeles,CA",
                    "api_key": "@user.api_key"
                  }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/road_trip", params: valid_data.to_json, headers: headers
    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(user_response).to be_a(Hash)
    expect(user_response).to have_key(:data)
    expect(user_response[:data]).to be_a(Hash)
    expect(user_response[:data]).to have_key(:id)
    expect(user_response[:data][:id]).to eq("null")
    expect(user_response[:data]).to have_key(:type)
    expect(user_response[:data][:type]).to eq("road_trip")
    expect(user_response[:data]).to have_key(:attributes)
    expect(user_response[:data][:attributes]).to be_a(Hash)
    expect(user_response[:data][:attributes]).to have_key(:start_city)
    expect(user_response[:data][:attributes][:start_city]).to be_a(String)
    expect(user_response[:data][:attributes]).to have_key(:end_city)
    expect(user_response[:data][:attributes][:end_city]).to be_a(String)
    expect(user_response[:data][:attributes]).to have_key(:travel_time)
    expect(user_response[:data][:attributes][:travel_time]).to be_a(String)
    expect(user_response[:data][:attributes]).to have_key(:weather_at_eta)
    expect(user_response[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(user_response[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
    expect(user_response[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)
    expect(user_response[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(user_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(user_response[:data][:attributes][:weather_at_eta]).to have_key(:condition)
    expect(user_response[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
  end
end