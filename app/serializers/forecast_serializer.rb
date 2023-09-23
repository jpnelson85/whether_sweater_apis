class ForecastSerializer
  def forecast_data(current_forecast, daily_forecast, hourly_forecast)
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
          daily_weather: daily_forecasts.map do |day|
            { date: day.date,
              sunrise: day.sunrise,
              sunset: day.sunset,
              max_temp_f: day.max_temp_f,
              min_temp_f: day.min_temp_f,
              condition_text: day.condition_text,
              condition_icon: day.condition_icon
            }
          end,
          hourly_weather: hourly_forecasts.map do |hour|
            { time: hour.time,
              temp_f: hour.temp_f,
              condition_text: hour.condition_text,
              condition_icon: hour.condition_icon
            }
          end
        }
      }
    }
  end
end