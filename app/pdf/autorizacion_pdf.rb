=begin
class AutorizacionPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      image open("#{Rails.root}/app/pdf/autorizacion_en_blanco.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "#{@credit.nombre_completo_deudor}",:size=>8, :at => [60,455]
      draw_text  "#{@credit.RFC} ",:size=>8, :at => [100,418]
      draw_text  "#{@credit.calle}, ##{@credit.numero_exterior}",:size=>8, :at => [120,405]
      draw_text  "#{@credit.colonia} ",:size=>8, :at => [100,395]
      draw_text  "#{@credit.localidad} ",:size=>8, :at => [100,385]
      draw_text  "#{@credit.estado_actual} ",:size=>8, :at => [270,385]
      draw_text  "#{@credit.codigo_postal} ",:size=>8, :at => [470,385]
      draw_text  "#{@credit.fecha.strftime("%d-%m-%Y")} ",:size=>8, :at => [270,370]
      
  end
end
=end
class AutorizacionPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    text_content
  end
  def text_content
     font_size 9
     image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, position: :left
     text " "
     text " "
     text "Autorización para solicitar Reportes de Crédito" , :size => 10,:align => :center, :style => :bold
     text " "
     text " "
     text " "
     text " "
     text "Autorización para:",:size =>10,:align => :justify 
     text "Persona Física (PF) [ X ] 	 Persona Física con Actividad Empresarial (PFAE) [ ]       Persona Moral (PM) [ ] ",:size =>10,:align => :justify 
     
     text "Por este conducto autorizo expresamente a Financiera Marjo, S.A. de C.V., SOFOM, ENR, para que por conducto de sus funcionarios facultados lleve a cabo investigaciones sobre mi comportamiento crediticio o el de la empresa que represento en las Sociedades de Información Crediticia que estime conveniente.",:size =>10,:align => :justify 
     text " "
     text "Así mismo, declaro que conozco la naturaleza y alcance de las sociedades de información crediticia y de la información contenida en los reportes de crédito y reporte de crédito especial, declaro que conozco la naturaleza y alcance de la información que se solicitará, del uso que Financiera Marjo, S.A. de C.V., SOFOM, ENR hará de tal información y de que ésta podrá realizar consultas periódicas de mi historial crediticio o el de la empresa que represento, consintiendo que esta autorización se encuentre vigente por un período de 3 años contados a partir de la fecha de su expedición y en todo caso durante el tiempo que mantengamos relación jurídica.",:size =>10,:align => :justify 
     text " "
     text "En caso de que la solicitante sea una Persona Moral, declaro bajo protesta de decir verdad Ser Representante Legal de la empresa mencionada en esta autorización; manifestando que a la fecha de firma de la presente autorización los poderes no me han sido revocados, limitados, ni modificados en forma alguna",:size =>10,:align => :justify 
          
    text " "
    text "Nombre del solicitante (Persona Física o Denominación / Razón Social de la Persona Moral):
                 #{@credit.nombre_completo_deudor} ",:size =>10,:align => :justify 
    text "Para el caso de persona Moral, nombre del Representante Legal:
#{@credit.nombre_completo_deudor}
 R.F.C. #{@credit.customer.RFC}
 Calle y Número #{@credit.customer.calle}, ##{@credit.customer.numero_exterior}
 Colonia #{@credit.customer.colonia}
 Ciudad #{@credit.customer.localidad}  Estado #{@credit.customer.estado_actual}  Codigo Postal #{@credit.customer.codigo_postal}
 Lugar y Fecha en que se firma la autorización: #{@credit.fecha.strftime("%d-%m-%Y")}
 Nombre del funcionario que recaba la autorización: ___________________________
"
    text " "
    text  "Estoy consciente y acepto que este documento quede bajo custodia de Financiera Marjo, S.A. de C.V., SOFOM, ENR y/o Sociedad de Información Crediticia consultada para efectos de control y cumplimiento del artículo 28 de la Ley para Regular a Las Sociedades de Información Crediticia; mismo que señala que las Sociedades sólo podrán proporcionar información a un Usuario, cuando éste cuente con la autorización expresa del Cliente mediante su firma autógrafa.
",:size =>10,:align => :justify 
  text " "
  text "___________________________________________________________________
Nombre y Firma de PF, PFAE o Representante Legal de la empresa
 ",:size =>10,:align => :justify 
  text " "
  text "___________________________________________________________________________________________________________
Para uso exclusivo de Financiera Marjo, S.A. de C.V., SOFOM, ENR
Clave de usuario:_______________________________________
Fecha de la consulta (dd-mm-aaaa):______________________
Folio de consulta (Obligatorio):________________________
Firma: ________________________________________________________________",:size =>10,:align => :justify
text"IMPORTANTE: Este formato debe ser llenado individualmente, para una sola persona física ó para una sola empresa. En caso de requerir el Historial crediticio del representante legal, favor de llenar un formato adicional.",:size =>10,:align => :justify 
text"__________________________________________________________________________________________________________
#{Conf.last.domicilio} TEL. #{Conf.last.telefono}
CULIACÁN DE ROSALES, SINALOA #{Conf.last.correo}",:size =>10,:align => :justify 
  
  end
end