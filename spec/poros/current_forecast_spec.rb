require "rails_helper"

RSpec.describe "Current Forecast" do
  it "can create a current forecast PORO" do
    current_forecast_data = ({ :current=>
                                { :last_updated=>"2021-07-28 16:00",
                                  :temp_f=>91.9,
                                  :feelslike_f=>91.9,
                                  :humidity=>13,
                                  :uv=>9.0,
                                  :vis_miles=>6.2,
                                  :condition=>
                                    {:text=>"Sunny",
                                    :icon=>"//cdn.weatherapi.com/weather/64x64/day/113.png"}
                              }})

    current_forecast = CurrentForecast.new(current_forecast_data)

    expect(current_forecast).to be_a(CurrentForecast)
    expect(current_forecast.last_updated).to be_a(String)
    expect(current_forecast.temp_f).to be_a(Float)
    expect(current_forecast.feelslike_f).to be_a(Float)
    expect(current_forecast.humidity).to be_a(Integer).or be_a(Float)
    expect(current_forecast.uv).to be_a(Float).or be_a(Integer)
    expect(current_forecast.vis_miles).to be_a(Float).or be_a(Integer)
    expect(current_forecast.condition_text).to be_a(String)
    expect(current_forecast.condition_icon).to be_a(String)
  end
end