json.array!(@countries) do |country|
  json.extract! country, :id, :nombre, :clave
end
