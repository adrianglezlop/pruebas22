class ContratoMunicipalPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
        text "Original",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA" , :align  => :center, :style=> :bold
   
   el_interes=@credit.monto_solicitud*(@credit.product.taza_de_interes_ordinaria/100)
   cap_mas_int= @credit.monto_solicitud + el_interes
   iva_del_interes=el_interes * 0.16
   com_por_apert=cap_mas_int * (6.75/100)
 
 
    monto_a_pagar= cap_mas_int + iva_del_interes + com_por_apert

    
    #pago_parcial=monto_a_pagar/24
    pago_parcial=monto_a_pagar/@credit.product.numero_de_pagos_a_realizar
    
    xmeses=@credit.product.numero_de_pagos_a_realizar/2
    
     text " "
    text " "
    text " "
    
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de crédito y garantía, por una parte el(la) Sr(a) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:",:size =>10,:align => :justify 
    
    text " "
    text "CLAUSULAS" , :align  => :center, :style=> :bold
     text " "
    
    text "PRIMERA: 'El Acreedor' ha convenido otorgar un crédito por la cantidad de  $ #{Dinero.to_money(@credit.monto_solicitud)}(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N) y 'El Deudor' en este acto da en garantía un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text " "
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text " "
    text "TERCERA: La entrega de los recursos a que se refiere la cláusula primera de este contrato se hará por transferencia electrónica al Deudor.",:size =>10,:align => :justify
    text " "
    #text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de #{@credit.product.taza_de_interes_ordinaria}%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de 74.4%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text " "
    text "QUINTA: En caso de incumplimiento de las obligaciones que se mencionan en la cláusula cuarta, las sumas vencidas del capital causarán  intereses moratorios desde el día siguiente al de su vencimiento y durante el tiempo y en la medida en que no se ha pagada correctamente, a una tasa de interés moratorio fija de 193.57 % anual, estos intereses se devengarán y vencerán diariamente. Los intereses moratorios se calcularán multiplicando el saldo vencido por la tasa de interés moratoria efectiva desde el día inmediato siguiente de su vencimiento hasta el de su pago total.",:size =>10,:align => :justify
    text " "
    text "SEXTA: 'El Acreedor' cobrará al 'El Deudor' una comisión por administración de cartera, dicha comisión se calculará con base en el monto total del crédito otorgado, por un porcentaje correspondiente al 6.75% del mismo. Los pagos de la comisión por administración de cartera se realizarán el cargo de forma quincenal.",:size =>10,:align => :justify
    #text Interes= #{el_interes},   cap_mas_int=#{cap_mas_int},  iva_Int=#{iva_del_interes},  com_apert=#{com_por_apert} 
    text " "
    text "SEPTIMA: ‘El Deudor' se obliga a pagar a 'El Acreedor' la cantidad de #{Dinero.to_money(monto_a_pagar)}, (#{Dinero.to_words(monto_a_pagar)}) pesos 00/100 M.N) en un plazo de #{xmeses} meses, mediante #{@credit.product.numero_de_pagos_a_realizar} pagos  quincenales contados a partir de la firma del presente contrato, mediante la siguiente forma: #{@credit.product.numero_de_pagos_a_realizar} pagos quincenales y consecutivos, cada uno de ellos  por la cantidad de $ #{Dinero.to_money(pago_parcial)}, (#{Dinero.to_words(pago_parcial)} pesos 00/100 M.N)",:size =>10,:align => :justify
    text " "
    text "OCTAVA: ‘El Deudor' se obliga realizar los pagos Quincenales que se señala  en la cláusula séptima abonando a la cuenta bancaria No. 11793890, Banco el Bajío, en las fechas de vencimiento pactadas o en su caso a través del descuento en la nómina.",:size =>10,:align => :justify
    text " "
    text "NOVENA: Ambos partes convienen en que todo pago que realice 'El Deudor',  se aplique de la siguiente manera, intereses moratorios, gastos y comisiones, intereses ordinarios, que en su caso se hayan devengado y por último el pago al capital del crédito.",:size =>10,:align => :justify
    text " "
    text "DECIMA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con la cláusula séptima, se dará por vencido este contrato debiendo 'El Acreedor' exigir a 'El Deudor':",:size =>10,:align => :justify
    text " "
    text "      A. Interés moratorios de 193.57 % por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :left 
    text "      B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :left 
    text "      C. La recisión de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :left  
    text " "
    text "DECIMA PRIMERA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción. ",:size =>10,:align => :justify
    text " "
    text "DECIMA SEGUNDA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de CULIACÁN, SINALOA, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole. ",:size =>10,:align => :justify
    text " "
    text "Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify
    text " "
    text " "
    text " "
     text " "
    text " "
    text " "
    text "________________________ 		    	         		  __________________________" ,:size =>10,:align => :center
    text "         'EL ACREEDOR' 	                                   	 'EL DEUDOR'       ",:size =>10,:align => :center
   text " "
   text " "
    text "* CAT (Costo Anual Total) #{@credit.product.cat_sin_iva}% sin IVA.",:size =>8,:align => :left
    text "* Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)",:size =>8,:align => :left
    text "Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx",:size =>8,:align => :left
    text "*Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}",:size =>8,:align => :left
    start_new_page
    
    text "Copia 1",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA" , :align  => :center, :style=> :bold
   
   el_interes=@credit.monto_solicitud*(@credit.product.taza_de_interes_ordinaria/100)
   cap_mas_int= @credit.monto_solicitud + el_interes
   iva_del_interes=el_interes * 0.16
   com_por_apert=cap_mas_int * (6.75/100)
 
 
    monto_a_pagar= cap_mas_int + iva_del_interes + com_por_apert

    
    #pago_parcial=monto_a_pagar/24
    pago_parcial=monto_a_pagar/@credit.product.numero_de_pagos_a_realizar
    
    xmeses=@credit.product.numero_de_pagos_a_realizar/2
    
     text " "
    text " "
    text " "
    
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de crédito y garantía, por una parte el(la) Sr(a) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:",:size =>10,:align => :justify 
    
    text " "
    text "CLAUSULAS" , :align  => :center, :style=> :bold
     text " "
    
    text "PRIMERA: 'El Acreedor' ha convenido otorgar un crédito por la cantidad de  $ #{Dinero.to_money(@credit.monto_solicitud)}(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N) y 'El Deudor' en este acto da en garantía un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text " "
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text " "
    text "TERCERA: La entrega de los recursos a que se refiere la cláusula primera de este contrato se hará por transferencia electrónica al Deudor.",:size =>10,:align => :justify
    text " "
    #text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de #{@credit.product.taza_de_interes_ordinaria}%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de 74.4%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text " "
    text "QUINTA: En caso de incumplimiento de las obligaciones que se mencionan en la cláusula cuarta, las sumas vencidas del capital causarán  intereses moratorios desde el día siguiente al de su vencimiento y durante el tiempo y en la medida en que no se ha pagada correctamente, a una tasa de interés moratorio fija de 193.57 % anual, estos intereses se devengarán y vencerán diariamente. Los intereses moratorios se calcularán multiplicando el saldo vencido por la tasa de interés moratoria efectiva desde el día inmediato siguiente de su vencimiento hasta el de su pago total.",:size =>10,:align => :justify
    text " "
    text "SEXTA: 'El Acreedor' cobrará al 'El Deudor' una comisión por administración de cartera, dicha comisión se calculará con base en el monto total del crédito otorgado, por un porcentaje correspondiente al 6.75% del mismo. Los pagos de la comisión por administración de cartera se realizarán el cargo de forma quincenal.",:size =>10,:align => :justify
    #text Interes= #{el_interes},   cap_mas_int=#{cap_mas_int},  iva_Int=#{iva_del_interes},  com_apert=#{com_por_apert} 
    text " "
    text "SEPTIMA: ‘El Deudor' se obliga a pagar a 'El Acreedor' la cantidad de #{Dinero.to_money(monto_a_pagar)}, (#{Dinero.to_words(monto_a_pagar)}) pesos 00/100 M.N) en un plazo de #{xmeses} meses, mediante #{@credit.product.numero_de_pagos_a_realizar} pagos  quincenales contados a partir de la firma del presente contrato, mediante la siguiente forma: #{@credit.product.numero_de_pagos_a_realizar} pagos quincenales y consecutivos, cada uno de ellos  por la cantidad de $ #{Dinero.to_money(pago_parcial)}, (#{Dinero.to_words(pago_parcial)} pesos 00/100 M.N)",:size =>10,:align => :justify
    text " "
    text "OCTAVA: ‘El Deudor' se obliga realizar los pagos Quincenales que se señala  en la cláusula séptima abonando a la cuenta bancaria No. 11793890, Banco el Bajío, en las fechas de vencimiento pactadas o en su caso a través del descuento en la nómina.",:size =>10,:align => :justify
    text " "
    text "NOVENA: Ambos partes convienen en que todo pago que realice 'El Deudor',  se aplique de la siguiente manera, intereses moratorios, gastos y comisiones, intereses ordinarios, que en su caso se hayan devengado y por último el pago al capital del crédito.",:size =>10,:align => :justify
    text " "
    text "DECIMA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con la cláusula séptima, se dará por vencido este contrato debiendo 'El Acreedor' exigir a 'El Deudor':",:size =>10,:align => :justify
    text " "
    text "      A. Interés moratorios de 193.57 % por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :left 
    text "      B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :left 
    text "      C. La recisión de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :left  
    text " "
    text "DECIMA PRIMERA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción. ",:size =>10,:align => :justify
    text " "
    text "DECIMA SEGUNDA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de CULIACÁN, SINALOA, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole. ",:size =>10,:align => :justify
    text " "
    text "Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify
    text " "
    text " "
    text " "
     text " "
    text " "
    text " "
    text "________________________ 		    	         		  __________________________" ,:size =>10,:align => :center
    text "         'EL ACREEDOR' 	                                   	 'EL DEUDOR'       ",:size =>10,:align => :center
   text " "
   text " "
    text "* CAT (Costo Anual Total) #{@credit.product.cat_sin_iva}% sin IVA.",:size =>8,:align => :left
    text "* Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)",:size =>8,:align => :left
    text "Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx",:size =>8,:align => :left
    text "*Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}",:size =>8,:align => :left
    start_new_page
    
    text "Copia 2",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA" , :align  => :center, :style=> :bold
   
   el_interes=@credit.monto_solicitud*(@credit.product.taza_de_interes_ordinaria/100)
   cap_mas_int= @credit.monto_solicitud + el_interes
   iva_del_interes=el_interes * 0.16
   com_por_apert=cap_mas_int * (6.75/100)
 
 
    monto_a_pagar= cap_mas_int + iva_del_interes + com_por_apert

    
    #pago_parcial=monto_a_pagar/24
    pago_parcial=monto_a_pagar/@credit.product.numero_de_pagos_a_realizar
    
    xmeses=@credit.product.numero_de_pagos_a_realizar/2
    
     text " "
    text " "
    text " "
    
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de crédito y garantía, por una parte el(la) Sr(a) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:",:size =>10,:align => :justify 
    
    text " "
    text "CLAUSULAS" , :align  => :center, :style=> :bold
     text " "
    
    text "PRIMERA: 'El Acreedor' ha convenido otorgar un crédito por la cantidad de  $ #{Dinero.to_money(@credit.monto_solicitud)}(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N) y 'El Deudor' en este acto da en garantía un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text " "
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text " "
    text "TERCERA: La entrega de los recursos a que se refiere la cláusula primera de este contrato se hará por transferencia electrónica al Deudor.",:size =>10,:align => :justify
    text " "
    #text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de #{@credit.product.taza_de_interes_ordinaria}%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text "CUARTA: 'El Deudor' se obliga a pagar a 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de 74.4%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y se devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fechas de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text " "
    text "QUINTA: En caso de incumplimiento de las obligaciones que se mencionan en la cláusula cuarta, las sumas vencidas del capital causarán  intereses moratorios desde el día siguiente al de su vencimiento y durante el tiempo y en la medida en que no se ha pagada correctamente, a una tasa de interés moratorio fija de 193.57 % anual, estos intereses se devengarán y vencerán diariamente. Los intereses moratorios se calcularán multiplicando el saldo vencido por la tasa de interés moratoria efectiva desde el día inmediato siguiente de su vencimiento hasta el de su pago total.",:size =>10,:align => :justify
    text " "
    text "SEXTA: 'El Acreedor' cobrará al 'El Deudor' una comisión por administración de cartera, dicha comisión se calculará con base en el monto total del crédito otorgado, por un porcentaje correspondiente al 6.75% del mismo. Los pagos de la comisión por administración de cartera se realizarán el cargo de forma quincenal.",:size =>10,:align => :justify
    #text Interes= #{el_interes},   cap_mas_int=#{cap_mas_int},  iva_Int=#{iva_del_interes},  com_apert=#{com_por_apert} 
    text " "
    text "SEPTIMA: ‘El Deudor' se obliga a pagar a 'El Acreedor' la cantidad de #{Dinero.to_money(monto_a_pagar)}, (#{Dinero.to_words(monto_a_pagar)}) pesos 00/100 M.N) en un plazo de #{xmeses} meses, mediante #{@credit.product.numero_de_pagos_a_realizar} pagos  quincenales contados a partir de la firma del presente contrato, mediante la siguiente forma: #{@credit.product.numero_de_pagos_a_realizar} pagos quincenales y consecutivos, cada uno de ellos  por la cantidad de $ #{Dinero.to_money(pago_parcial)}, (#{Dinero.to_words(pago_parcial)} pesos 00/100 M.N)",:size =>10,:align => :justify
    text " "
    text "OCTAVA: ‘El Deudor' se obliga realizar los pagos Quincenales que se señala  en la cláusula séptima abonando a la cuenta bancaria No. 11793890, Banco el Bajío, en las fechas de vencimiento pactadas o en su caso a través del descuento en la nómina.",:size =>10,:align => :justify
    text " "
    text "NOVENA: Ambos partes convienen en que todo pago que realice 'El Deudor',  se aplique de la siguiente manera, intereses moratorios, gastos y comisiones, intereses ordinarios, que en su caso se hayan devengado y por último el pago al capital del crédito.",:size =>10,:align => :justify
    text " "
    text "DECIMA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con la cláusula séptima, se dará por vencido este contrato debiendo 'El Acreedor' exigir a 'El Deudor':",:size =>10,:align => :justify
    text " "
    text "      A. Interés moratorios de 193.57 % por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :left 
    text "      B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :left 
    text "      C. La recisión de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :left  
    text " "
    text "DECIMA PRIMERA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción. ",:size =>10,:align => :justify
    text " "
    text "DECIMA SEGUNDA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de CULIACÁN, SINALOA, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole. ",:size =>10,:align => :justify
    text " "
    text "Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify
    text " "
    text " "
    text " "
     text " "
    text " "
    text " "
    text "________________________ 		    	         		  __________________________" ,:size =>10,:align => :center
    text "         'EL ACREEDOR' 	                                   	 'EL DEUDOR'       ",:size =>10,:align => :center
   text " "
   text " "
    text "* CAT (Costo Anual Total) #{@credit.product.cat_sin_iva}% sin IVA.",:size =>8,:align => :left
    text "* Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)",:size =>8,:align => :left
    text "Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx",:size =>8,:align => :left
    text "*Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}",:size =>8,:align => :left
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
