json.array!(@photoavatars) do |photoavatar|
  json.extract! photoavatar, :id, :title, :content
  json.url photoavatar_url(photoavatar, format: :json)
end
