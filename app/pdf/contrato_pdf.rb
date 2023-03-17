class ContratoPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
        text "Original",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      
   " , :align  => :center, :style=> :bold
 
  
      text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a 6 meses  a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 PRÉSTAMO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} #{@credit.product.payout.periocidad}. La tasa de interes del préstamo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún recibo se encuentre con más de 1 días, independientemente de su adeudo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el cliente demuestre para la apertura del presente contrato de apertura de crédito.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de crédito, debiendo 'El Acreedor' exigir a 'El Deudor'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'EL ACREEDOR'                                                                                                             'EL DEUDOR'",:size =>10,:align => :justify 
    text"
    "
   text" * CAT (Costo Anual Total) #{@credit.cat_sin_iva}% sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>8,:align => :justify  
    start_new_page
    
    
    
   text"Copia 1",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      
   " , :align  => :center, :style=> :bold
 
  
      text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 PRÉSTAMO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10     
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del préstamo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}",:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún recibo se encuentre con más de 1 días, independientemente de su adeudo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el cliente demuestre para la apertura del presente contrato de apertura de crédito.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de crédito, debiendo 'El Acreedor' exigir a 'El Deudor'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'EL ACREEDOR'                                                                                                             'EL DEUDOR'",:size =>10,:align => :justify 
    text"
    "
   text" * CAT (Costo Anual Total) #{@credit.cat_sin_iva}% sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>8,:align => :justify   
  start_new_page
    
    
   text"Copia 2",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      
   " , :align  => :center, :style=> :bold
 
  
     text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 PRÉSTAMO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del préstamo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún recibo se encuentre con más de 1 días, independientemente de su adeudo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el cliente demuestre para la apertura del presente contrato de apertura de crédito.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de crédito, debiendo 'El Acreedor' exigir a 'El Deudor'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'EL ACREEDOR'                                                                                                             'EL DEUDOR'",:size =>10,:align => :justify 
    text"
    "
   text" * CAT (Costo Anual Total) #{@credit.cat_sin_iva}% sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    
    ",:size =>8,:align => :justify  
start_new_page
    
text "PAGARÉ                                                                                                     No._______ BUENO POR $ ________________",:size =>10
text" 
"
text "En ___________________________ a ____ de _____________ de 20___ ",:size =>10,:align => :right
text" 
"
text "Debo(emos) y pagaré(mos) incondicionalmente por este pagaré a la orden de __________________________________",:size =>10,:align => :justify 
text" 
"
text "______________________________________________________ el ________________________________________",:size =>10,:align => :justify 
text" 
"
text "Valor recibido a mi(nuestra) entera satisfacción. Este pagaré está sujeto a las condiciones de que al no pagarse a su vencimiento, será exigible desde la fecha de su vencimiento de este documento hasta el dia de su total liquidación, causando intereses moratorios al tipo de _____% mensual pagadero en esta ciudad juntamente con el principal.

",:size =>10,:align => :justify 
text "Nombre y datos de 'EL DEUDOR'                          Nombre y datos de 'EL AVAL'",:size =>10,:align => :center 
text" "
text "Nombre: _______________________________________     Nombre: _______________________________________",:size =>10,:align => :justify 
text"   "
text "Domicilio:__________________________Tel._________       Domicilio:__________________________Tel._________",:size =>10,:align => :justify 
text "Acepto(amos)                                                                           Acepto(amos)",:size =>10,:align => :left 
text" 
"
text "Firma(s)________________________________________      Firma(s)________________________________________",:size =>10,:align => :justify 
  end
end
