class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp_f,
              :min_temp_f,
              :condition_text,
              :condition_icon

  def initialize(data)
    @date = data[:forecast][:forecastday][:date]
    @sunrise = data[:forecast][:forecastday][:astro][:sunrise]
    @sunset = data[:forecast][:forecastday][:astro][:sunset]
    @max_temp_f = data[:forecast][:forecastday][:day][:maxtemp_f]
    @min_temp_f = data[:forecast][:forecastday][:day][:mintemp_f]
    @condition_text = data[:forecast][:forecastday][:day][:condition][:text]
    @condition_icon = data[:forecast][:forecastday][:day][:condition][:icon]
  end
end