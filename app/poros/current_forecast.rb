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
    @last_updated = data[:current][:last_updated]
    @temp_f = data[:current][:temp_f]
    @feelslike_f = data[:current][:feelslike_f]
    @humidity = data[:current][:humidity]
    @uv = data[:current][:uv]
    @vis_miles = data[:current][:vis_miles]
    @condition_text = data[:current][:condition][:text]
    @condition_icon = data[:current][:condition][:icon]
  end
end