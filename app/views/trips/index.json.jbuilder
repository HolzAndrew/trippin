json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :lat, :long, :trip_date, :user_id
  json.url trip_url(trip, format: :json)
end
