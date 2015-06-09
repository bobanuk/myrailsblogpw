json.array!(@bobans) do |boban|
  json.extract! boban, :id, :title, :content
  json.url boban_url(boban, format: :json)
end
