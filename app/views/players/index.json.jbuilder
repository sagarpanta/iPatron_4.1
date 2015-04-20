json.array!(@players) do |player|
  json.extract! player, :id, :address, :clublevel, :contact, :encrypted_password, :encrypted_password_confirmation, :name, :playerid, :ptsBal, :ptsRed
  json.url player_url(player, format: :json)
end
