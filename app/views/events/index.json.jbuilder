json.array!(@events) do |event|
  json.extract! event, :id, :code, :description, :startdate, :enddate, :playerid, :read
  json.url event_url(event, format: :json)
end
