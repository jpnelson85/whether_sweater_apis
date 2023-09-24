class ForecastSerializer
  def forecast_data(current_forecast, daily_forecasts, hourly_forecasts)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            last_updated: current_forecast.last_updated,
            temp_f: current_forecast.temp_f,
            feelslike_f: current_forecast.feelslike_f,
            humidity: current_forecast.humidity,
            uv: current_forecast.uv,
            vis_miles: current_forecast.vis_miles,
            condition_text: current_forecast.condition_text,
            condition_icon: current_forecast.condition_icon
          },
          daily_weather: daily_forecasts.map do |daily_forecast|
            { date: daily_forecast.date,
              sunrise: daily_forecast.sunrise,
              sunset: daily_forecast.sunset,
              max_temp_f: daily_forecast.max_temp_f,
              min_temp_f: daily_forecast.min_temp_f,
              condition_text: daily_forecast.condition_text,
              condition_icon: daily_forecast.condition_icon
            }
          end,
          hourly_weather: hourly_forecasts.map do |day_forecast|
            day_forecast.map do |hourly_forecast|
            { time: hourly_forecast.time_in_string,
              temp_f: hourly_forecast.temp_f,
              condition_text: hourly_forecast.condition_text,
              condition_icon: hourly_forecast.condition_icon
            }
            end
          end
        }
      }
    }
  end
end