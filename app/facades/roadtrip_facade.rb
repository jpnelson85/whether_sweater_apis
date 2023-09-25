class RoadtripFacade
  def self.get_roadtrip_details(start, destination)
    route = MapQuestService.new.get_route(start, destination)
    if route[:route][:formattedTime].present?
      eta = round
    end
      render json: { error: 'Impossible Route', status: 400 }
    else
      destination_lat = route[:route][:locations][1][:latLng][:lat]
      destination_long = route[:route][:locations][1][:latLng][:lng]
      real_time = route[:route][:realTime]
      arrival_time = Time.now + real_time
      arrival_time_formatted = arrival_time.strftime("%Y-%m-%d %H:%M')

      forecast = ForecastFacade.get_daily_weather(destination_lat, destination_l)

      forecast[:forecast][:forecastday].each do |day|
        next unless real_time.to_s.include?(day[:date])
        arrival_forecast_details = {
          datetime: arrival_time_formatted,
          temperature: day[:hour][arrive_time.hour][:temp_f],
          condition: day[:hour][arrive_time.hour][:condition][:text]
        }
      end
      Roadtrip.new(start, destination, arrival_time_formatted, eta, arrival_forecast_details)
    end
  end
end