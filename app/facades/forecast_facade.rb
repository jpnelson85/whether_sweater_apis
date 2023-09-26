class ForecastFacade
  def self.get_forecast(location)
    all_weather = ForecastService.new.get_city_weather(location)
    current_weather = CurrentForecast.new(all_weather[:current])
    daily_weather = get_daily_weather(all_weather[:forecast][:forecastday])
    hourly_weather = get_hourly_weather(all_weather[:forecast][:forecastday])
    [current_weather, daily_weather, hourly_weather]
  end

  def self.get_daily_weather(all_weather)
    all_weather.map do |day|
      DailyForecast.new(day)
    end
  end

  def self.get_hourly_weather(all_weather)
    all_weather.map do |day|
      day[:hour].map do |hour|
        HourlyForecast.new(hour)
      end
    end
  end
end