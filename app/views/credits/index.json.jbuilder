json.array!(@credits) do |credit|
  json.extract! credit, :id, :fecha,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:fecha_de_contrato,:monto_solicitud,:agente_empresa,:referencia_agente_empresa, :product_id
  json.monto_solicitud_formato Dinero.to_money credit.monto_solicitud
  json.nombre_completo_deudor credit.nombre_completo_deudor
  json.url credit_url(credit, format: :json)
  json.nombre_padre (credit.padre.nil?)? "Desconocido":credit.padre.nombre_completo
  json.fecha_formato credit.fecha.strftime("%d/%m/%Y")
  json.cancelar credit_path(credit,:credit=>{status:2})
  json.imprimir "/view_credits/documentos?clave=#{credit.id}"
  json.tipo current_user.tipo
  json.sucursal credit.padre.branch_office.nombre
  json.fecha_de_contrato_formato credit.fecha_de_contrato.strftime("%d/%m/%Y") unless credit.fecha_de_contrato.nil?
  json.nombre_agente credit.padre.nombre_completo
  json.product_id credit.product_id
end
