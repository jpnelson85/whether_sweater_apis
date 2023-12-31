class Roadtrip
  attr_reader :start_city, 
              :end_city,
              :travel_time,
              :weather_at_destination

  def initialize(start, destination, travel_time, weather)
    @origin = start
    @destination = destination
    @travel_time = travel_time
    @weather_at_destination = weather
  end
end