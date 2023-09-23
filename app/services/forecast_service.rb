class ForecastService

  def conn
    Faraday.new(url: "https://api.weatherapi.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_city_weather(lat, long)
    get_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{lat},#{long}&days=5")
  end
end