class CurrentForecast
  attr_reader :last_updated,
              :temp_f,
              :feelslike_f,
              :humidity,
              :uv,
              :vis_miles,
              :condition_text,
              :condition_icon

  def initialize(data)
    @last_updated = data[:last_updated]
    @temp_f = data[:temp_f]
    @feelslike_f = data[:feelslike_f]
    @humidity = data[:humidity]
    @uv = data[:uv]
    @vis_miles = data[:vis_miles]
    @condition_text = data[:condition][:text]
    @condition_icon = data[:condition][:icon]
  end
end