class ForecastService

  def conn
    Faraday.new(url: "https://api.weatherapi.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_city_weather(location)
    coordinates = MapQuestService.new.get_lat_long(location)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    get_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{latitude},#{longitude}&days=5")
  end
end