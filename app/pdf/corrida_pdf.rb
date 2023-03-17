class CorridaPdf < Prawn::Document
  def initialize(credit,arreglo)
    super()
    @credit = credit 
    @arreglo = arreglo
    text_content
  end
  
  def header
    #This inserts an image in the pdf file and sets the size of the image
   
  end
  
  def text_content
   #monto_a_pagar= @credit.monto_solicitud*(1+(@credit.product.taza_de_interes_ordinaria/100))
   monto_a_pagar= @credit.monto_solicitud*(1+(@credit.taza_ord/100))
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45
    text "#{@credit.nombre_completo_deudor}"
    table([["FECHA DE PRESTAMO", @credit.fecha_de_contrato.strftime("%d/%m/%Y")], 
          ["MONTO PRESTAMO",Dinero.to_money(@credit.monto_solicitud)], 
          ["MONTO A PAGAR", Dinero.to_money(monto_a_pagar)], 
          ["PAGO FIJO", Dinero.to_money(monto_a_pagar/@credit.product.numero_de_pagos_a_realizar)], 
          #["TASA INTERES","#{'%.2f' % @credit.product.taza_de_interes_ordinaria}%"], 
          ["TASA INTERES","#{'%.2f' % @credit.taza_ord}%"], 
          ["PLAZO "," #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
          ["PERIODICIDAD", @credit.product.payout.periocidad], 
          ["CAT SIN IVA","#{'%.2f' % @credit.cat_sin_iva}%"]],:cell_style => { size: 8 })
    move_down 20
    table(@arreglo,:cell_style => { size: 8 })
    start_new_page 

    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45
    text "#{@credit.nombre_completo_deudor}"
    table([["FECHA DE PRESTAMO", @credit.fecha_de_contrato.strftime("%d/%m/%Y")], 
          ["MONTO PRESTAMO",Dinero.to_money(@credit.monto_solicitud)], 
          ["MONTO A PAGAR", Dinero.to_money(monto_a_pagar)], 
          ["PAGO FIJO", Dinero.to_money(monto_a_pagar/@credit.product.numero_de_pagos_a_realizar)], 
          #["TASA INTERES","#{'%.2f' % @credit.product.taza_de_interes_ordinaria}%"], 
          ["TASA INTERES","#{'%.2f' % @credit.taza_ord}%"], 
          ["PLAZO "," #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
          ["PERIODICIDAD", @credit.product.payout.periocidad], 
          ["CAT SIN IVA","#{'%.2f' % @credit.cat_sin_iva}%"]],:cell_style => { size: 8 })
    move_down 20
    table(@arreglo,:cell_style => { size: 8 })

  end
end