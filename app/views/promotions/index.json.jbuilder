json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :code, :description, :drawingtime, :enddate, :num_of_entries, :playerid, :read, :startdate
  json.url promotion_url(promotion, format: :json)
end
