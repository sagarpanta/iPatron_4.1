json.array!(@notifications) do |notification|
  json.extract! notification, :id, :code, :description, :notification, :read
  json.url notification_url(notification, format: :json)
end
