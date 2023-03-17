
tabla =  Credit.joins(:payments=>:tickets).
 select("credits.nombre_1||' '||credits.nombre_2||' '||credits.apellido_paterno||' '||credits.apellido_materno as nombre_completo",
 :monto_solicitud,
 "sum(payments.importe) as monto_a_pagar")
 .group("payments.credit_id")
 .group(:payment)
 
 tabla2 = []
 credits = Company.last.credits
 fecha = "2017-03-31"
 #credits = Credit.all
 credits.each do |credit|
  fila = Hash.new("query")
  fila["nombre_completo"] = "#{credit.nombre_1} #{credit.nombre_2} #{credit.apellido_paterno} #{credit.apellido_paterno}"
  fila["fecha"] = credit.fecha
  fila["monto_solicitud"] = credit.monto_solicitud
  fila["monto_a_pagar"] = credit.payments.sum(:importe)
  fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ?",credit.id).sum(:cantidad)
  fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
  fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha).sum(:importe).to_s.to_d
  pagos = Payment.all.where("credit_id = ? and fecha_de_pago < ?", credit.id, fecha)
  fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
  fila["interes_moratorio"] = pagos.sum(:interes).to_s.to_d
  fila["total_a_cobrar"] = fila["interes_moratorio"] + fila["atrasado"] + fila["pagar"]
  fila["cobrado"] = 0
  fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["diferencia"].to_s.to_d
  fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_pago > ?",credit.id, fecha).sum(:cantidad)
  fila["empresa"] = credit.padre.nombre_completo
  fila["numero_de_pago"] = Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha)[0].recibo
  fila["numero_de_creditos"] = credit.padre.credits.count
  tabla2 << fila
 end
  puts " nombre complero     -----       montonto solicitud ----- monto_a_pagar ----- adeudo ----- pagar   --- atrasado --- interes_moratorio --- total a cobrar --- cobrado--- diferencia ---adelantado ---empresa ---numero_de_pago --- numero_de_creditos  "
 tabla2.each do |a|
  puts "#{a["nombre_completo"]}  ----  #{a["monto_solicitud"]} --- #{a["monto_a_pagar"]}  --- #{a["adeudo"]} --- #{a["pagar"]}  --- #{a["atrasado"]} --- #{a["interes_moratorio"]} --- #{a["total_a_cobrar"]} --- #{a["cobrado"]} ---#{a["diferencia"]}--- #{a["adelantado"]} ---#{a["empresa"]}---#{a["numero_de_pago"]}--- #{a["numero_de_creditos"]}"
 end
 
 
 
 
 open('combos.rb', 'w') do |f|
    f.puts "if (CCountry.count == 0)"
    CCountry.all.each do |cc|
        f.puts "CCountry.create(nombre:'#{cc.nombre}',clave:'#{cc.clave}')"
    end
    f.puts "end"
    f.puts "if (CState.count == 0)"
    CState.all.each do |cc|
        f.puts "CState.create(nombre:'#{cc.nombre}',clave:'#{cc.clave}',c_country_id:#{cc.c_country_id})"
    end
    f.puts "end"
    f.puts "if (CCountry.count == 0)"
    CMunicipality.all.each do |cc|
        f.puts "CMunicipality.create(nombre:'#{cc.nombre}',clave:'#{cc.clave}',c_state_id:#{cc.c_state_id})"
    end
    f.puts "end"
end


