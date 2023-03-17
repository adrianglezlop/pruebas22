class EstadoDeCuentaPdf < Prawn::Document
  def initialize(r,fechas)
    super(:margin => [50,50,50,50])
    @customer=r
    base_size = 7
    @f1 = fechas[0]
    @f2 = fechas[1]
    @credits = @customer.credits.select(:id,:monto_solicitud,:fecha_de_contrato,:product_id)
    @credits  = @credits.select(:id).where("credits.fecha_de_contrato > ?",@f1.to_date) unless @f1.nil?
    @credits  = @credits.select(:id).where("credits.fecha_de_contrato < ?",@f2.to_date) unless @f2.nil?
    text_content
    page_count.times do |i|
      go_to_page(i+1)
      draw_text  "*CAT (COSTO ANUAL TOTAL) 115.82% SIN IVA" ,:size=>base_size, :at => [-10, bounds.bottom + 0]
      draw_text  "*CONDUSEF" ,:size=>base_size, :at => [-10, bounds.bottom + -8]
      draw_text  "COMISION PARA LA PROTECCION Y LA DEFENSA DE USUARIOS DE SERVICIOS FINANCIEROS. TEL (55) 5340 0999 8080 Y 01 800 999 8080 www.condusef.gob.mx" ,:size=>base_size, :at => [-10, bounds.bottom - 16]
    end
  end
  def text_content
    base_size = 9
    contador = 0
    @credits.where.not(status:2).each do |credit| 
      payments = credit.payments.order(:fecha_de_pago)
      image "#{Rails.root}/app/assets/images/logo marjo.png", width: 220, height: 30,position: :right
      text  "FINANCIERA MARJO SA DE CV SOFOM ENR",:size=>base_size+4
      text  "#{Conf.last.domicilio}",:size=>base_size
      text  "CULIACAN DE ROSALES, SINALOA C.P. 80128",:size=>base_size
      text  "R.F.C. #{Conf.last.RFC}",:size=>base_size
      text  "Telefonos: #{Conf.last.telefono}",:size=>base_size
      text  "____________________________________________________________________________"
      
      table([ ["No. de cliente : #{@customer.id}", "Fecha de apertura: #{Auxiliar.fecha_natural(credit.fecha_de_contrato)}"],
           ["Cliente : #{@customer.nombre_completo_deudor}", "Fecha de vencimiento: #{Auxiliar.fecha_natural(payments.last.fecha_de_pago) }"],
           ["Cuenta : #{credit.id}", "Capital Concedido: #{Dinero.to_money credit.monto_solicitud}"],
           ["Periodo : Del #{(@f1.nil?)? "Inicio " : Auxiliar.fecha_natural(@f1) } al","Plazo pactado: #{credit.product.numero_de_pagos_a_realizar } #{credit.product.payout.periocidad}"],
           [" #{(@f2.nil?)? "Fin " : Auxiliar.fecha_natural(@f2)}","Periocidad: #{credit.product.payout.periocidad}"],
           [" ","Tasa de Interes: #{credit.product.taza_de_interes_ordinaria}%"]
           ],:cell_style => {:border_width => 0, :padding => [0, 20, 0, 0],:size => base_size})
           text "Detalle Saldo"
      text  "____________________________________________________________________________"
      capital = credit.getAPagar/(1 + (credit.product.taza_de_interes_ordinaria / 100))
      interes = credit.getAPagar - capital
      limPago = (credit.product.proximaFechaDeCorte.fecha_de_pago > credit.payments.order(:fecha_de_pago).last.fecha_de_pago)?  credit.payments.order(:fecha_de_pago).last.fecha_de_pago : credit.product.proximaFechaDeCorte.fecha_de_pago
      
      espacioEnBlanco = " "*24
        recuadro = make_table([[make_table([ [" Fecha Limite de Pago: #{Auxiliar.fecha_formato(limPago)} "], [" Pago Quincenal : #{Dinero.to_money credit.payments.last.importe} "] ],
        :cell_style => {:border_width => 0, :padding => [1, 3, 1, 3],:size => base_size})] ],
        :cell_style => {:border_width => [1,1,1,1], :padding => [1, 3, 1, 3],:size => base_size})
        tabla1 = make_table([ ["Interes pagado: #{Dinero.to_money credit.interes_pagado}"], ["Comisiones pagado: #{Dinero.to_money 0}"] ],
        :cell_style => {:border_width => 0, :padding => [0, 10, 0, 0],:size => base_size})
        tabla2 = make_table([ ["Interes Vencido: #{Dinero.to_money credit.interes_vencido}"], ["Interes Moratorio: #{Dinero.to_money credit.interes_moratorio}"] ],
        :cell_style => {:border_width => 0, :padding => [0, 10, 0, 0],:size => base_size})
      table([
        ["Capital pagado: #{Dinero.to_money credit.capital_pagado}",espacioEnBlanco,"Capital Vencido: #{Dinero.to_money credit.capital_vencido}","Saldo Actual: #{Dinero.to_money credit.saldo_actual}"],
        [tabla1,espacioEnBlanco,tabla2,recuadro],
        ["",espacioEnBlanco,"Capital a pagar: #{Dinero.to_money capital}",""],
        ["",espacioEnBlanco,"Interes a pagar:#{Dinero.to_money interes} ",""]],
        :cell_style => {:border_width => 0, :padding => [0, 10, 0, 0],:size => base_size})
      text  "Detalle Movimientos"
      text  "____________________________________________________________________________"
      tickets = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = 0",credit.id)
      arreglo = []
      arreglo << ["F. OPERACION","MOVIMIENTO","F. RECIBO","IMPORTE"]
      tickets.each do |ticket|
        fecha_payment = ticket.payment.fecha_de_pago
        fecha_ticket = ticket.updated_at
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Capital",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_capital)]
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Interes",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_interes_sin_iva)]
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Iva",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_iva)]
      end
      table(arreglo,:cell_style => {:border_width => 0, :padding => [0, 30, 0, 30],:size => base_size})
      start_new_page
    end
  end
end
