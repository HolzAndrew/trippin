json.array!(@locations) do |location|
  json.extract! location, :id, :loc_long, :loc_lat, :address, :venue, :trip_id, :user_id
  json.url location_url(location, format: :json)
end
