json.results @results do |result|
  json.date result[:date]
  json.sunrise result[:sunrise]
  json.sunset result[:sunset]
  json.first_light result[:first_light]
  json.last_light result[:last_light]
  json.dawn result[:dawn]
  json.dusk result[:dusk]
  json.solar_noon result[:solar_noon]
  json.golden_hour result[:golden_hour]
  json.day_length result[:day_length]
  json.timezone result[:timezone]
  json.utc_offset result[:utc_offset]
end

json.status @status
