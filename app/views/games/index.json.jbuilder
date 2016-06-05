json.array!(@games) do |game|
  json.extract! game, :id, :team_one, :team_two, :winner, :date, :time
  json.url game_url(game, format: :json)
end
