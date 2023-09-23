class ForecastFacade
  def initialize(location)
    @location = location
  end

  def forecast
    forecast = ForecastService.new.forecast(@location)
    Forecast.new(forecast)
  end
end