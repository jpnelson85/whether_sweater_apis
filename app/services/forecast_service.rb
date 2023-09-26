class ForecastService

  def conn_weather
    Faraday.new(url: "https://api.weatherapi.com")
  end

  def conn_mapquest
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def get_mapquest_url(url)
    response = conn_mapquest.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_weather_url(url)
    response = conn_weather.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_city_weather(location)
    coordinates = MapQuestService.new.get_lat_long(location)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    get_weather_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{latitude},#{longitude}&days=5")
  end

  def get_destination_weather(latitude, longitude)
    get_weather_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{latitude},#{longitude}&days=5")
  end

  def get_roadtrip_details(origin, destination)
    coordinates = MapQuestService.new.get_lat_long(destination)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    route = MapQuestService.new.get_route(origin, destination)
    time = route[:route][:formattedTime]
    get_url("/v1/forecast.json?key=#{ENV['WEATHER_API_KEY']}&q=#{latitude},#{longitude}&days=5")
  end
end