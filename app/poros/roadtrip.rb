class Roadtrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start, destination, travel_time, weather)
    @id = nil
    @type = 'road_trip'
    @start_city = start
    @end_city = destination
    @travel_time = travel_time
    @weather_at_destination = weather
  end
end