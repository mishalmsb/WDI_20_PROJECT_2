json.array!(@users) do |user|
  json.extract! user, :id, :name, :money, :nationality, :notes, :picture
  json.url user_url(user, format: :json)
end
