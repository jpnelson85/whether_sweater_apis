class MapQuestService

  def conn 
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_lat_long(location)
    get_url("/geocoding/v1/address?key=#{ENV['MAP_QUEST_API_KEY']}&location=#{location}")
  end
end