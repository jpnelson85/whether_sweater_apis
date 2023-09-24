class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp_f,
              :min_temp_f,
              :condition_text,
              :condition_icon

  def initialize(data)
    @date = data[:date]
    @sunrise = data[:astro][:sunrise]
    @sunset = data[:astro][:sunset]
    @max_temp_f = data[:day][:maxtemp_f]
    @min_temp_f = data[:day][:mintemp_f]
    @condition_text = data[:day][:condition][:text]
    @condition_icon = data[:day][:condition][:icon]
  end
end