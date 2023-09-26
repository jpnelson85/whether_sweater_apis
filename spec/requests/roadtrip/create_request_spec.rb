require "rails_helper"

RSpec.describe "Roadtrip Index" do
  before :each do
    @user = User.create!(email: "jeff@jeff.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")  
  end
  it "can return roadtrip data", :vcr do
    valid_data = {  "origin": "New York,NY",
                    "destination": "Los Angeles,CA",
                    "api_key": @user.api_key
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

  # sad path
  it "can't return roadtrip data when api_key is invalid", :vcr do
    invalid_data = {  "origin": "New York,NY",
                    "destination": "Los Angeles,CA",
                    "api_key": "125125125"
                  }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/road_trip", params: invalid_data.to_json, headers: headers
    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq("Unauthorized")
    expect(user_response[:status]).to eq(401)
  end

  # sad path
  it "can't return roadtrip data when route is impossible", :vcr do
    invalid_data = {  "origin": "Sydney,AU",
                    "destination": "Los Angeles,CA",
                    "api_key": @user.api_key
                  }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/road_trip", params: invalid_data.to_json, headers: headers
    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq("Impossible Route")
    expect(user_response[:status]).to eq(400)
  end
end