class RoadtripSerializer
  def self.serialize(start, destination, roadtrip, weather)
    {
      data: {
        id: 'null',
        type: 'road_trip',
        attributes: {
          start_city: start,
          end_city: destination,
          travel_time: roadtrip.real_travel_time,
          weather_at_eta: {
            temperature: weather.temperature,
            conditions: weather.condition
          }
        }
      }
    }
  end
end