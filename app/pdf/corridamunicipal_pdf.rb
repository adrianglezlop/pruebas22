class CorridamunicipalPdf< Prawn::Document
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
    monto_a_pagar= @credit.monto_solicitud*(1+(@credit.product.taza_de_interes_ordinaria/100))
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45
    text "#{@credit.nombre_completo_deudor}"
    taInteres= @credit.product.taza_de_interes_ordinaria/(24)
    table([["CAPITAL",Dinero.to_money(@credit.monto_solicitud)] , 
          ["COMISIÓN POR APERTURA", 6.75], 
          ["SEGURO DE VIDA", Dinero.to_money(0)], 
          #["TASA INTERÉS","#{'%.2f' % @credit.product.taza_de_interes_ordinaria}%"], 
          ["TASA INTERÉS", "#{'%.2f' % taInteres}%"], 
          ["PLAZO "," #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
          ["TASA ANUAL", @credit.product.taza_de_interes_ordinaria], 
          ["INTERÉS", Dinero.to_money(monto_a_pagar-@credit.monto_solicitud)]],:cell_style => { size: 8 })
          #["CAT SIN IVA","#{'%.2f' % @credit.product.cat_sin_iva}%"]],:cell_style => { size: 8 })
    move_down 20
    table(@arreglo,:cell_style => { size: 8 })

  end
end