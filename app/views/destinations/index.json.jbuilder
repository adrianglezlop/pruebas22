json.array!(@destinations) do |destination|
  json.extract! destination, :id, :descricion
  json.url destination_url(destination, format: :json)
end
