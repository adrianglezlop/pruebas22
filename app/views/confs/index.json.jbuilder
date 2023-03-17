json.array!(@confs) do |conf|
  json.extract! conf, :id, :telefono, :domicilio, :correo
  json.url conf_url(conf, format: :json)
end
