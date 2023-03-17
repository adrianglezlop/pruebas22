json.array!(@municipalities) do |municipality|
  json.extract! municipality, :id, :nombre, :clave,:c_state_id
end
