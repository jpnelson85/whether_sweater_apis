require "rails_helper"

RSpec.describe "Daily Forecast Poro" do 
  it "can create a daily forecast PORO" do
    daily_forecast_data = DailyForecast.new(
      {
          :astro => {
            :sunrise => "06:00 AM",
            :sunset => "08:13 PM"
            },
          :date => "2021-07-28",
          :day => {
            :maxtemp_f => 91.9,
            :mintemp_f => 67.6,
            :condition => {
              :text => "Sunny",
              :icon => "//cdn.weatherapi.com/weather/64x64/day/113.png"
              }
            }
      })

      expect(daily_forecast_data).to be_a(DailyForecast)
    expect(daily_forecast_data.date).to be_a(String)
    expect(daily_forecast_data.max_temp_f).to be_a(Float)
    expect(daily_forecast_data.min_temp_f).to be_a(Float)
    expect(daily_forecast_data.condition_text).to be_a(String)
  end
end