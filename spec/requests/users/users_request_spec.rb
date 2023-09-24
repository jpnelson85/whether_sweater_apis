require "rails_helper"

RSpec.describe "Users Requests" do
  it "can create a user with valid credentials", :vcr do
    valid_data = {  "email": "j@gmail.com",
                    "password": "password",
                    "password_confirmation": "password"}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/users", params: valid_data.to_json, headers: headers

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(:created)

    expect(user_response).to be_a(Hash)
    expect(user_response).to have_key(:data)
    expect(user_response[:data]).to be_a(Hash)
    expect(user_response[:data]).to have_key(:id)
    expect(user_response[:data][:id]).to be_a(String)
    expect(user_response[:data]).to have_key(:type)
    expect(user_response[:data][:type]).to be_a(String)
    expect(user_response[:data]).to have_key(:attributes)
    expect(user_response[:data][:attributes]).to be_a(Hash)
    expect(user_response[:data][:attributes]).to have_key(:email)
    expect(user_response[:data][:attributes][:email]).to be_a(String)
    expect(user_response[:data][:attributes]).to have_key(:api_key)
    expect(user_response[:data][:attributes][:api_key]).to be_a(String)

    # sad path
    expect(user_response[:data][:attributes]).to_not have_key(:password)
    expect(user_response[:data][:attributes]).to_not have_key(:password_confirmation)
  end
end