require "rails_helper"

RSpec.describe "Forecast Service" do
  describe "class methods" do
    it "#get_city_weather", :vcr do
      lat = 39.738453
      long = -104.984853
      weather = ForecastService.new.get_city_weather(lat, long)

      expect(weather).to be_a(Hash)
      expect(weather).to have_key(:location)
      expect(weather[:location]).to be_a(Hash)
      expect(weather[:location]).to have_key(:name)
      expect(weather[:location][:name]).to be_a(String)
      expect(weather[:location]).to have_key(:region)
      expect(weather[:location][:region]).to be_a(String)
      expect(weather[:location]).to have_key(:lat)
      expect(weather[:location][:lat]).to be_a(Float)
      expect(weather[:location]).to have_key(:lon)
      expect(weather[:location][:lon]).to be_a(Float)
      expect(weather).to have_key(:current)
      expect(weather[:current]).to be_a(Hash)
      expect(weather[:current]).to have_key(:last_updated)
      expect(weather[:current][:last_updated]).to be_a(String)
      expect(weather[:current]).to have_key(:temp_f)
      expect(weather[:current][:temp_f]).to be_a(Float)
      expect(weather[:current]).to have_key(:feelslike_f)
      expect(weather[:current][:feelslike_f]).to be_a(Float)
      expect(weather[:current]).to have_key(:humidity)
      expect(weather[:current][:humidity]).to be_a(Integer).or be_a(Float)
      expect(weather[:current]).to have_key(:uv)
      expect(weather[:current][:uv]).to be_a(Integer).or be_a(Float)
      expect(weather[:current]).to have_key(:vis_miles)
      expect(weather[:current][:vis_miles]).to be_a(Integer).or be_a(Float)
      expect(weather[:current]).to have_key(:condition)
      expect(weather[:current][:condition]).to be_a(Hash)
      expect(weather[:current][:condition]).to have_key(:text)
      expect(weather[:current][:condition][:text]).to be_a(String)
      expect(weather[:current][:condition]).to have_key(:icon)
      expect(weather[:current][:condition][:icon]).to be_a(String)

      expect(weather[:forecast]).to be_a(Hash)
      expect(weather[:forecast]).to have_key(:forecastday)
      expect(weather[:forecast][:forecastday]).to be_an(Array)
      expect(weather[:forecast][:forecastday].count).to eq(5)
      expect(weather[:forecast][:forecastday][0]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0]).to have_key(:date)
      expect(weather[:forecast][:forecastday][0][:date]).to be_a(String)
      expect(weather[:forecast][:forecastday][0]).to have_key(:astro)
      expect(weather[:forecast][:forecastday][0][:astro]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0][:astro]).to have_key(:sunrise)
      expect(weather[:forecast][:forecastday][0][:astro][:sunrise]).to be_a(String)
      expect(weather[:forecast][:forecastday][0][:astro]).to have_key(:sunset)
      expect(weather[:forecast][:forecastday][0][:astro][:sunset]).to be_a(String)
      expect(weather[:forecast][:forecastday][0]).to have_key(:day)
      expect(weather[:forecast][:forecastday][0][:day]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0][:day]).to have_key(:maxtemp_f)
      expect(weather[:forecast][:forecastday][0][:day][:maxtemp_f]).to be_a(Float)
      expect(weather[:forecast][:forecastday][0][:day]).to have_key(:mintemp_f)
      expect(weather[:forecast][:forecastday][0][:day][:mintemp_f]).to be_a(Float)
      expect(weather[:forecast][:forecastday][0][:day]).to have_key(:condition)
      expect(weather[:forecast][:forecastday][0][:day][:condition]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0][:day][:condition]).to have_key(:text)
      expect(weather[:forecast][:forecastday][0][:day][:condition][:text]).to be_a(String)
      expect(weather[:forecast][:forecastday][0][:day][:condition]).to have_key(:icon)
      expect(weather[:forecast][:forecastday][0][:day][:condition][:icon]).to be_a(String)

      expect(weather[:forecast][:forecastday][0][:hour]).to be_an(Array)
      expect(weather[:forecast][:forecastday][0][:hour].count).to eq(24)
      expect(weather[:forecast][:forecastday][0][:hour][0]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0][:hour][0]).to have_key(:time)
      expect(weather[:forecast][:forecastday][0][:hour][0][:time]).to be_a(String)
      expect(weather[:forecast][:forecastday][0][:hour][0]).to have_key(:temp_f)
      expect(weather[:forecast][:forecastday][0][:hour][0][:temp_f]).to be_a(Float)
      expect(weather[:forecast][:forecastday][0][:hour][0]).to have_key(:condition)
      expect(weather[:forecast][:forecastday][0][:hour][0][:condition]).to be_a(Hash)
      expect(weather[:forecast][:forecastday][0][:hour][0][:condition]).to have_key(:text)
      expect(weather[:forecast][:forecastday][0][:hour][0][:condition][:text]).to be_a(String)
      expect(weather[:forecast][:forecastday][0][:hour][0][:condition]).to have_key(:icon)
      expect(weather[:forecast][:forecastday][0][:hour][0][:condition][:icon]).to be_a(String)
    end
  end
end