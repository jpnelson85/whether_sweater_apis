require "rails_helper"

RSpec.describe "Sessions Requests" do
  before :each do
    user1 = User.create!(email: "jab@gmail.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")
  end

  it "can create a session with valid credentials", :vcr do
    valid_data = { "email": "jab@gmail.com", "password": "password" }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
    post "/api/v1/sessions", params: valid_data.to_json, headers: headers

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

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

  it "password or email can't be blank", :vcr do
    invalid_data = { "email": "", "password": "" }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/sessions", params: invalid_data.to_json, headers: headers

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq("Email or password are incorrrect")
    expect(user_response[:status]).to eq("unprocessible_entity")
  end

  # sad path
  it "email doesn't exist", :vcr do
    invalid_data = { "email": "bill@hotmail.com", "password": "12345" }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/sessions", params: invalid_data.to_json, headers: headers

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq("Email or password are incorrrect")
    expect(user_response[:status]).to eq("unprocessible_entity")
  end

  # sad path
  it "can't create a user if email already exists", :vcr do
    invalid_data = { "email": "jab@gmail.com", "password": "12345" }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}

    post "/api/v1/sessions", params: invalid_data.to_json, headers: headers

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq("Email or password are incorrrect")
    expect(user_response[:status]).to eq("unprocessible_entity")
  end
end