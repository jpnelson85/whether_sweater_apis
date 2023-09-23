class ForecastFacade
  def self.get_forecast(location)
    all_weather = ForecastService.get_city_weather(location)
    current_weather = CurrentWeather.new(all_weather[:current])
    daily_weather = get_daily_weather(all_weather[:daily])
    hourly_weather = get_hourly_weather(all_weather[:hourly])
    [current_weather, daily_weather, hourly_weather]
  end

  def self.get_daily_weather(all_weather)
    all_weather[0..4].map do |day|
      DailyForecast.new(day)
    end
  end

  def self.get_hourly_weather(all_weather)
    all_weather[0..7].map do |hour|
      HourlyForecast.new(hour)
    end
  end
end