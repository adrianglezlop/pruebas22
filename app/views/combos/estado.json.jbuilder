json.array!(@states) do |state|
  json.extract! state, :id, :nombre, :clave, :c_country_id
end
