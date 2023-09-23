class ForecastService

  def conn
    Faraday.new(url: "https://api.weatherapi.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_city_weather(location)
    coordinates = MapQuestService.get_lat_long(location)
    parsed_coordinates = JSON.parse(coordinates, symbolize_names: true)
    latitude = parsed_coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = parsed_coordinates[:results][0][:locations][0][:latLng][:lng]
    get_city_weather(latitude, longitude)
  end


  def get_city_weather(lat, long)
    get_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{lat},#{long}&days=5")
  end
end