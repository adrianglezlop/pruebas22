json.array!(@payments) do |payment|
  json.extract! payment, :id, :folio,:fecha_de_pago,:recibo,:estatus,:importe,:pago,:interes,:fecha_de_impresion,:credit_id
  json.activo payment.activo
  json.importe_formato Dinero.to_money payment.importe
  json.fecha_de_pago_formato payment.fecha_de_pago.strftime("%d/%m/%Y")
  json.fecha_de_contrato_formato payment.credit.fecha_de_contrato.strftime("%d/%m/%Y")
  json.cliente payment.credit.nombre_completo_deudor
  json.importe_con_pago payment.importe.to_f - payment.total_pagado.to_f 
  json.ultimo_recibo payment.tickets.last
  json.ultimo_recibo_url tickets_path(payment.tickets.last)
  json.credit_nombre payment.credit.nombre_completo_deudor
  json.fecha_de_contrato payment.credit.fecha_de_contrato
  json.padre payment.credit.padre.nombre_completo
  json.sucursal payment.credit.padre.branch_office.nombre
  json.nombre_agente payment.credit.padre.nombre_completo
  json.val payment.pago_empresa_ready
  json.f_ticket_id "#{"0"*(5-payment.tickets[0].id.to_s.length)+payment.tickets[0].id.to_s}" unless payment.tickets[0].nil? 
  json.fecha_contrato payment.credit.fecha_de_contrato.strftime("%d/%m/%Y")
end
