require "rails_helper"

RSpec.describe "Forecast by Location" do
  describe "happy path" do
    it "can get forecast by location and serialized properly", :vcr do
      city_state = "denver,co"
      get "/api/v1/forecast?location=#{city_state}"

      expect(response).to be_successful
      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq("forecast")

      # sad path
      expect(forecast[:data][:type]).to_not eq("weather")
      expect(forecast[:data][:attributes]).to_not be_a(Array)
      expect(forecast[:data][:id]).to_not be_a(Integer)

      attributes = forecast[:data][:attributes]
      expect(attributes).to be_a(Hash)
      expect(attributes).to have_key(:current_weather)
      expect(attributes[:current_weather]).to be_a(Hash)
      expect(attributes[:current_weather]).to have_key(:last_updated)
      expect(attributes[:current_weather][:last_updated]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:temp_f)
      expect(attributes[:current_weather][:temp_f]).to be_a(Float)
      expect(attributes[:current_weather]).to have_key(:feelslike_f)
      expect(attributes[:current_weather][:feelslike_f]).to be_a(Float)
      expect(attributes[:current_weather]).to have_key(:humidity)
      expect(attributes[:current_weather][:humidity]).to be_a(Integer).or be_a(Float)
      expect(attributes[:current_weather]).to have_key(:uv)
      expect(attributes[:current_weather][:uv]).to be_a(Integer).or be_a(Float)
      expect(attributes[:current_weather]).to have_key(:vis_miles)
      expect(attributes[:current_weather][:vis_miles]).to be_a(Integer).or be_a(Float)
      expect(attributes[:current_weather]).to have_key(:condition_text)
      expect(attributes[:current_weather][:condition_text]).to be_a(String)
      expect(attributes[:current_weather]).to have_key(:condition_icon)
      expect(attributes[:current_weather][:condition_icon]).to be_a(String)
      
      # sad path
      expect(attributes[:current_weather]).to_not have_key(:temp_c)
      expect(attributes[:current_weather]).to_not have_key(:wind_dir)
      expect(attributes[:current_weather]).to_not have_key(:wind_mph)

      expect(attributes).to have_key(:daily_weather)
      expect(attributes[:daily_weather]).to be_an(Array)
      expect(attributes[:daily_weather].count).to eq(5)
      attributes[:daily_weather].each do |day|
        expect(day).to be_a(Hash)
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a(String)
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a(String)
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a(String)
        expect(day).to have_key(:max_temp_f)
        expect(day[:max_temp_f]).to be_a(Float)
        expect(day).to have_key(:min_temp_f)
        expect(day[:min_temp_f]).to be_a(Float)
        expect(day).to have_key(:condition_text)
        expect(day[:condition_text]).to be_a(String)
        expect(day).to have_key(:condition_icon)
        expect(day[:condition_icon]).to be_a(String)

        # sad path
        expect(day).to_not have_key(:max_temp_c)
        expect(day).to_not have_key(:maxwind_mph)
        expect(day).to_not have_key(:totalprecip_in)
      end

      expect(attributes).to have_key(:hourly_weather)
      expect(attributes[:hourly_weather]).to be_an(Array)
      attributes[:hourly_weather].each do |day|
        day.each do |hour|
        expect(hour).to be_a(Hash)
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a(String)
        expect(hour).to have_key(:temp_f)
        expect(hour[:temp_f]).to be_a(Float)
        expect(hour).to have_key(:condition_text)
        expect(hour[:condition_text]).to be_a(String)

        # sad path
        expect(hour).to_not have_key(:temp_c)
        expect(hour).to_not have_key(:wind_dir)
        expect(hour).to_not have_key(:wind_mph)
        end
      end
    end
  end

  # sad path
  describe "sad path" do
    it 'returns an error if location is not provided', :vcr do
      location = ""
      get "/api/v1/forecast?location=#{location}"

      expect(response.message).to eq("Bad Request")
      expect(response.status).to eq(400)
    end
  end
end