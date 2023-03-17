class PolizamunPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
    rectangle [50,750], 500, 250
    des = 0
    draw_text  "FINANCIERA MARJO SA DE CV SOFOM ENR",:size=>9, :at => [70,720+des]
    draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [70,710+des]
    draw_text  "CULIACAN DE ROSALES, SINALOA C.P. 80128",:size=>9, :at => [70,700+des]
    draw_text  "#{Conf.last.RFC}",:size=>9, :at => [70,690+des]
    draw_text  "SUCURSAL: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680+des]
    
    draw_text  "Original ", :at => [460,730+des]
    draw_text  "FECHA ",:size=>9, :at => [460,710+des]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703+des]
    
    draw_text  "#{@credit.nombre_completo_deudor}", :at => [70,650+des]
    draw_text  "#{ Dinero.to_money(@credit.monto_solicitud) }", :at => [430,650+des]
    draw_text  "______________________________________________________________________", :at => [70,650+des]
    draw_text  "Paguese este cheque a:",:size=>8, :at => [70,635+des]
    draw_text  "Moneda  nacional",:size=>8, :at => [450,635+des]
    draw_text  "(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N. )",:size=>9, :at => [70,620+des]
    draw_text  "______________________________________________________________________", :at => [70,620+des]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610+des]
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600+des]
    
    draw_text  "_________________________", :at => [370,580+des]
    draw_text  "FIRMA DE RECIBIDO",:size=>8, :at => [400,570+des]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520+des]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520+des]
    draw_text  "TRANSFERENCIA: ",:size=> 9, :at => [270,520+des]
    draw_text  "AGENTE:  #{@credit.padre.nombre_completo}  ",:size=> 9, :at => [370,520+des]
    
    rectangle [50,350], 500, 250 
    
    
    
    des = -400 
    
    draw_text  "FINANCIERA MARJO SA DE CV SOFOM ENR",:size=>9, :at => [70,720+des]
    draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [70,710+des]
    draw_text  "CULIACAN DE ROSALES, SINALOA C.P. 80128",:size=>9, :at => [70,700+des]
    draw_text  "#{Conf.last.RFC}",:size=>9, :at => [70,690+des]
    draw_text  "SUCURSAL: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680+des]
    
    draw_text  "Copia ", :at => [460,730+des]
    draw_text  "FECHA ",:size=>9, :at => [460,710+des]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703+des]
    
    draw_text  "#{@credit.nombre_completo_deudor}", :at => [70,650+des]
    draw_text  "#{ Dinero.to_money(@credit.monto_solicitud) }", :at => [430,650+des]
    draw_text  "______________________________________________________________________", :at => [70,650+des]
    draw_text  "Paguese este cheque a:",:size=>8, :at => [70,635+des]
    draw_text  "Moneda nacional",:size=>8, :at => [450,635+des]
    draw_text  "(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N. )",:size=>9, :at => [70,620+des]
    draw_text  "______________________________________________________________________", :at => [70,620+des]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610+des]
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600+des]
    
    draw_text  "_________________________", :at => [370,580+des]
    draw_text  "FIRMA DE RECIBIDO",:size=>8, :at => [400,570+des]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520+des]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520+des]
    draw_text  "TRANSFERENCIA:  #{@credit.numero_de_cheque}  ",:size=> 9, :at => [270,520+des]
    draw_text  "AGENTE:  #{@credit.padre.nombre_completo}  ",:size=> 9, :at => [370,520+des]
    stroke()
  end
end
