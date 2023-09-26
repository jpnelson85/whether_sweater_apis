class RoadtripFacade
  def self.get_roadtrip_details(start, destination)
    route = MapQuestService.new.get_route(start, destination)
    if route[:route].has_key?(:routeError)
      Roadtrip.new(start, destination, 'Impossible Route', {})
    else
      latitude = route[:route][:locations][1][:latLng][:lat]
      longitude = route[:route][:locations][1][:latLng][:lng]

      travel_time = route[:route][:realTime]
      arrival = Time.now + travel_time
      format_arrival = arrival.strftime('%Y-%m-%dT%H:%M')
      format_travel = route[:route][:formattedTime]

      weather = ForecastService.new.get_destination_weather(latitude, longitude)

      weather[:forecast][:forecastday].map do |day|
        next unless arrival.to_s.include?(day[:date])
        @arrival_weather = {
                                datetime: format_arrival,
                                temperature: day[:hour][arrival.hour][:temp_f],
                                condition: day[:hour][arrival.hour][:condition][:text]
                                }
      end
      Roadtrip.new(start, destination, format_travel, @arrival_weather)
    end
  end
end
