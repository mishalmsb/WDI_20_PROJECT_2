json.array!(@bets) do |bet|
  json.extract! bet, :id, :user_id, :user_two_id, :value, :status, :game_id
  json.url bet_url(bet, format: :json)
end
