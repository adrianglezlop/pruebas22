class CorridamunPdf< Prawn::Document
  def initialize(credit,arreglomun)
    super()
    @credit = credit 
    @arreglomun = arreglomun
    text_content
  end
  
  def header
    #This inserts an image in the pdf file and sets the size of the image
   
  end
  
  def text_content
    
    el_interes=@credit.monto_solicitud*(@credit.product.taza_de_interes_ordinaria/100)
    cap_mas_int= @credit.monto_solicitud + el_interes
    iva_del_interes=el_interes * 0.16
    com_por_apert=cap_mas_int * (6.75/100)
   
    #text "Interes= #{el_interes},   cap_mas_int=#{cap_mas_int},  iva_Int=#{iva_del_interes},  com_apert=#{com_por_apert}"
    
    #monto_a_pagar= @credit.monto_solicitud*(1+(@credit.product.taza_de_interes_ordinaria/100))
    
    monto_a_pagar= cap_mas_int + iva_del_interes + com_por_apert
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 145, height: 35
    text "#{@credit.nombre_completo_deudor}"
    table([["FECHA DE PRESTAMO", @credit.fecha_de_contrato.strftime("%d/%m/%Y")], 
          ["MONTO PRESTAMO",Dinero.to_money(@credit.monto_solicitud)], 
          ["MONTO A PAGAR", Dinero.to_money(monto_a_pagar)], 
          ["PAGO FIJO", Dinero.to_money(monto_a_pagar/@credit.product.numero_de_pagos_a_realizar)], 
          ["TASA INTERES","#{'%.2f' % @credit.product.taza_de_interes_ordinaria}%"], 
          ["COMISION APERTURA","#{'%.2f' % @credit.product.comision_apert}%"],
          ["PLAZO "," #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
          ["PERIODICIDAD", @credit.product.payout.periocidad], 
          ["CAT SIN IVA","#{'%.2f' % @credit.product.cat_sin_iva}%"]],:cell_style => { size: 7.5 })
    move_down 10
    table(@arreglomun,:cell_style => { size: 7.5 })

  end
end