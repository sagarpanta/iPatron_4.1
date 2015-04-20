json.array!(@offers) do |offer|
  json.extract! offer, :id, :code, :description, :startdate, :enddate, :playerid, :read, :total_bulbs
  json.url offer_url(offer, format: :json)
end
