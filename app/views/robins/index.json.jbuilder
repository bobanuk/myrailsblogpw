json.array!(@robins) do |robin|
  json.extract! robin, :id, :title, :content
  json.url robin_url(robin, format: :json)
end
