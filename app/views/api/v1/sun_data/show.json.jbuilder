json.results do
  json.date        @data[:results][:date]
  json.sunrise     @data[:results][:sunrise]
  json.sunset      @data[:results][:sunset]
  json.first_light @data[:results][:first_light]
  json.last_light  @data[:results][:last_light]
  json.dawn        @data[:results][:dawn]
  json.dusk        @data[:results][:dusk]
  json.solar_noon  @data[:results][:solar_noon]
  json.golden_hour @data[:results][:golden_hour]
  json.day_length  @data[:results][:day_length]
  json.timezone    @data[:results][:timezone]
  json.utc_offset  @data[:results][:utc_offset]
end

json.status @data[:status]
