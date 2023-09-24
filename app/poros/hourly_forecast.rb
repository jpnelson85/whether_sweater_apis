class HourlyForecast
  attr_reader :time_in_string,
              :temp_f,
              :condition_text,
              :condition_icon

  def initialize(data)
    @time_in_string = data[:time]
    @temp_f = data[:temp_f]
    @condition_text = data[:condition][:text]
    @condition_icon = data[:condition][:icon]
  end
end