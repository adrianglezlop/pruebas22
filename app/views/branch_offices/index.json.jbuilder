json.array!(@branch_offices) do |branch_office|
  json.extract! branch_office, :id, :nombre, :calle, :no_ext, :no_int, :colonia, :codigo_postal, :municipio, :estado, :telefono_oficina, :telefono_celular, :correo1, :correo2, :comision_por_colocacion, :comision_por_cobranza, :monto_maximo_adeudo_sucursal, :formato_impresion
  json.url branch_office_url(branch_office, format: :json)
end
