class EntrevistaPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    text_content
  end
  def text_content
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 190, height: 45
      text "________________________________________________________________________________"
      text "
      ENTREVISTA DEL CLIENTE 
      ",:size => 10, :align => :center, :style  => :bold
      text "Sucursal :#{@credit.padre.branch_office.nombre} Empresa : #{@credit.padre.nombre_completo}
      ",:size => 10
      text "R.F.C. : #{@credit.customer.RFC} CURP : #{@credit.customer.CURP} INE/IFE : #{@credit.customer.INE}
      ",:size => 10
      text "NOMBRE COMPLETO : #{@credit.customer.nombre_completo_deudor}
      ",:size => 10
      text "DOMICILIO: #{@credit.customer.calle}
      ",:size => 10
      text "PAIS DOMICILIO : #{@credit.customer.country}  ESTADO DOMICILIO : #{@credit.customer.estado_actual}
      ",:size => 10
      text "MUNICIPIO DOMICILIO :  #{@credit.customer.municipio}
      ",:size => 10
      text "COLONIA: #{@credit.customer.colonia}    NUM. EXTERIOR: #{@credit.customer.numero_exterior} NUM. INTERIOR: #{@credit.customer.numero_interior}
      ",:size => 10
      text "CODIGO POSTAL : #{@credit.customer.codigo_postal} ANTIGUEDAD DEL DOMICILIO :#{@credit.antiguedad_en_el_domicilio_actual_anos} AÑOS CON  #{@credit.antiguedad_en_el_domicilio_actual_meses } MESES  
      ",:size => 10
      text "TEL PARTICULAR : #{@credit.customer.telefono_de_casa}  TEL OFICINA :  #{@credit.customer.telefono_empresa}
      ",:size => 10
      text "CELULAR : #{@credit.customer.telefono_celular} E-MAIL : #{@credit.customer.email_1}
      ",:size => 10
      text "SEXO : #{(@credit.customer.sexo)?"MASCULINO":"FEMENINO"}    NO. DE DEPENDIENTES : #{@credit.customer.numero_de_dependientes_economicos}
      ",:size => 10
      text "GASTO PROMEDIO :  #{(@credit.customer.gasto_promedio_mensual)}  ESTADO CIVIL : #{@credit.customer.estado_civil_cadena}
      ",:size => 10
      text "NOMBRE COMPLETO CÓNYUGE : #{@credit.customer.apellido_paterno_del_conyuge}  #{@credit.customer.apellido_materno_del_conyuge}  #{@credit.customer.nombre_1_del_conyuge} #{@credit.customer.nombre_2_del_conyuge}
      ",:size => 10
      text "CEL CÓNYUGE : #{@credit.customer.telefono_celular_del_conyuge}   TEL OFICINA CÓNYUGE: #{@credit.customer.telefono_de_oficina_del_conyuge}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 1 : #{@credit.customer.nombre_completo_1}
      ",:size => 10
      text "EDAD DEPENDIENTE 1 :  #{@credit.customer.edad_1} AÑOS
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 1: #{@credit.customer.parentesco_del_dependiente_1}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 2:  #{@credit.customer.nombre_completo_2}
      ",:size => 10
      text "EDAD DEPENDIENTE 2: #{@credit.customer.edad_2} AÑOS
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 2: #{@credit.customer.parentesco_del_dependiente_2}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 3:  #{@credit.customer.nombre_completo_3}
      ",:size => 10
      text "EDAD DEPENDIENTE 3: #{@credit.customer.edad_3}
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 3: #{@credit.customer.parentesco_del_dependiente_3}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 4:  #{@credit.customer.nombre_completo_4}
      ",:size => 10
      text "EDAD DEPENDIENTE 4: #{@credit.customer.edad_4}
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 4: #{@credit.customer.parentesco_del_dependiente_4}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 5 : 
      ",:size => 10
      text "EDAD DEPENDIENTE 5 : 
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 5: 
      ",:size => 10
      text "PAIS DE NAC : #{@credit.customer.country}     ESTADO DE NAC :  #{@credit.customer.estado_de_nacimiento}
      ",:size => 10
      text "MUNICIPIO DE NAC : #{@credit.customer.ciudad_de_nacimiento}     NACIONALIDAD : #{@credit.customer.nacionalidad}
      ",:size => 10
      text "FEC NACIMIENTO : #{@credit.customer.fecha_de_nacimiento.strftime("%d/%m/%Y")}    FEC INGRESO TRABAJO : #{@credit.fecha - @credit.antiguedad_laboral_anos.year - @credit.antiguedad_laboral_meses.month}
      ",:size => 10
      text "NOMBRE DE LA EMPRESA : #{@credit.customer.empresa_donde_labora}
      ",:size => 10
      text "TEL EMPRESA : #{@credit.customer.telefono_empresa}    DOMICILIO EMP : #{@credit.customer.dirreccion_empresa}
      ",:size => 10
      text "COLONIA EMP : #{@credit.customer.colonia_empresa}
      ",:size => 10
      text "MUNICIPIO EMP : #{@credit.customer.municipio_empresa}
      ",:size => 10
      text "ANTIGUEDAD DE LA EMPRESA : #{@credit.antiguedad_laboral_anos} AÑOS CON #{@credit.antiguedad_laboral_meses} MESES
      ",:size => 10
      text "ACTIVIDAD ECONOMICA : #{@credit.customer.economical_activity.descripcion} 
      ",:size => 10 
      text "PROFESION : #{(@credit.customer.profecion.nil?)? "": @credit.customer.profecion.descripcion} 
      ",:size => 10
      text "OCUPACION:  #{(@credit.customer.ocupation.nil?)? "": @credit.customer.ocupation.descripcion}
      ",:size => 10
      text "SUELDO MENSUAL: #{(@credit.customer.sueldo_mensual_neto)}   NSS: #{@credit.customer.seguro} 
      ",:size => 10
      text "PARA QUE NECESITA EL CREDITO : #{@credit.destination.descricion}
      ",:size => 10
      text "NOMBRE REFERENCIA 1 : #{@credit.customer.nombre_referencia_1}
      ",:size => 10
      text "DOMICILIO REFERENCIA 1 : #{@credit.customer.domicilio_referencia_1}
      ",:size => 10
      text "TELEFONO REFERENCIA 1: FIJO: #{@credit.customer.telefono_fijo_referencia_1} CEL: #{@credit.customer.telefono_celular_referencia_1}
      ",:size => 10
      text "NOMBRE REFERENCIA 2 :  #{@credit.customer.nombre_referencia_2}
      ",:size => 10
      text "DOMICILIO REFERENCIA 2 :  #{@credit.customer.domicilio_referencia_2}
      ",:size => 10
      text "TELEFONO REFERENCIA 2: FIJO: #{@credit.customer.telefono_fijo_referencia_2} CEL: #{@credit.customer.telefono_celular_referencia_2}
      ",:size => 10
      text "NOMBRE FAMILIAR: #{@credit.customer.nombre_referencia_familiar}
      ",:size => 10
      text "DOMICILIO FAMILIAR : #{@credit.customer.domicilio_referencia_familiar}
      ",:size => 10
      text "TELEFONO FAMILIAR: #{@credit.customer.telefono_fijo_referencia_familiar} CEL: #{@credit.customer.telefono_celular_referencia_familiar}
      ",:size => 10
      text "OBSERVACIONES: #{@credit.customer.observaciones}
      ",:size => 10
      text "* DECLARO BAJO PROTESTA DE DECIR VERDAD QUE LA INFORMACIÓN AQUÍ CONTENIDA ES PRODUCTO 
      ",:size => 10
      text "DE LA ENTREVISTA QUE ME FUE REALIZADA 
      ",:size => 10
  end
end
