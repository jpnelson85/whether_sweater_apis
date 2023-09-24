require "rails_helper"

RSpec.describe "Hourly Forecast Poro" do
  it "can create a hourly forecast PORO" do
    hourly_forecast_data = HourlyForecast.new(
                                  { :time=>"2021-07-28 17:00",
                                    :temp_f=>91.9,
                                    :condition=>{:text=>"Sunny", :icon=>"//cdn.weatherapi.com/weather/64x64/day/113.png"}
                            })

    expect(hourly_forecast_data).to be_a(HourlyForecast)
    expect(hourly_forecast_data.time_in_string).to be_a(String)
    expect(hourly_forecast_data.temp_f).to be_a(Float)
    expect(hourly_forecast_data.condition_text).to be_a(String)
  end
end