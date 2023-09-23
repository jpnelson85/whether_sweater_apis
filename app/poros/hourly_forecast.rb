class HourlyForecast
  attr_reader :time,
              :temp_f,
              :condition_text,
              :condition_icon

  def initialize(data)
    @time = data[:forecast][:forecastday][:hour][:time]
    @temp_f = data[:forecast][:forecastday][:hour][:temp_f]
    @condition_text = data[:forecast][:forecastday][:hour][:condition][:text]
    @condition_icon = data[:forecast][:forecastday][:hour][:condition][:icon]
  end
end