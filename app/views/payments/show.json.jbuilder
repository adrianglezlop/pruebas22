json.array!(@credit.payments.order(:fecha_de_pago)) do |payment|
  json.extract! payment, :id, :folio,:fecha_de_pago,:recibo,:estatus,:importe,:pago,:interes
  json.activo payment.activo
  json.nombre_deudor payment.credit.nombre_completo_deudor
  json.importe_formato Dinero.to_money payment.importe
  json.importe_con_pago payment.importe.to_f - payment.total_pagado.to_f 
  json.fecha_de_pago_formato payment.fecha_de_pago.strftime("%d/%m/%Y")
  json.interes_formato Dinero.to_money payment.interes
  json.importe_con_pago_formato Dinero.to_money (payment.interes_flag==true)?  (payment.importe.to_f - payment.total_pagado.to_f) : (payment.importe.to_f + payment.interes.to_f - payment.total_pagado.to_f) 
  json.ultimo_recibo payment.tickets.last
  ticket = payment.tickets.last
  json.folio "2503616176B#{"0"*(5-ticket.id.to_s.length)+ticket.id.to_s}" unless ticket.nil?
  json.ultimo_recibo_url tickets_path(payment.tickets.last)
  json.empresa_agente payment.credit.padre.nombre_completo
end
