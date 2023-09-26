class RoadtripSerializer
  def self.serialize(start, destination, roadtrip, weather)
    # require 'pry'; binding.pry
    {
      data: {
        id: 'null',
        type: 'road_trip',
        attributes: {
          start_city: start,
          end_city: destination,
          travel_time: roadtrip,
          weather_at_eta: {
            datetime: weather.weather_at_destination[:datetime],
            temperature: weather.weather_at_destination[:temperature],
            condition: weather.weather_at_destination[:condition]
          }
        }
      }
    }
  end
end