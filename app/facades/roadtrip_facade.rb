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

#   route = MapQuestService.new.get_route(start, destination)
    
  #   if route[:route][:formattedTime].present?
  #     eta = round_time(route[:route][:formattedTime])
  #     dest_temp = get_dest_temp(destination, eta.to_i)
  #     dest_condition = get_dest_condition(destination, eta.to_i)
  #     Roadtrip.new(start, destination, dest_condition)
  #   else route[:route][:formattedTime].nil?
  #     'Impossible Route'
  #   end
  # end

  # def self.round_time(time)
  #   if eta.present?
  #     hours, minutes, seconds = eta.split(':')
  #     minutes.to_i >= 30 ? hours.to_i.ceil : hours.to_i.round
  #   elsif eta.nil?
  #     'Impossible Route'
  #   end
  # end

  # def self.get_dest_temp(destination, eta)
  #   if eta == 'Impossible Route'
  #     'Impossible Route'
  #   elsif
  #     eta.to_i > 48
  #     forecast = ForecastService.get_city_weather(destination)
  #     weather[:daily_weather][eta.to_i][:temp]
  #   elsif
  #     weather = ForecastService.get_city_weather(destination)
  #     weather[:hourly_weather][eta.to_i][:temp]
  #   end
  # end

  # def self.get_dest_condition(destination, eta)
  #   if eta == 'Impossible Route'
  #     'Impossible Route'
  #   elsif
  #     eta.to_i > 48
  #     forecast = ForecastService.get_city_weather(destination)
  #     weather[:daily][3][:weather][0][:description]
  #   else
  #     weather = ForecastService.get_city_weather(destination)
  #     if weather[:hourly][eta.to_i][:weather][0][:description].present?
  #       weather[:hourly][eta.to_i][:weather][0][:description]
  #     else
  #       weather[:hourly][eta.to_i + 1][:weather][0][:description]
  #     end
  #   end
  # end