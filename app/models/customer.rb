class Customer < ActiveRecord::Base
  belongs_to :economical_activity
  belongs_to :ocupation
  belongs_to :profecion
  has_many :credits
  validates :RFC, uniqueness: true
  validates :CURP, uniqueness: true
  validates :referencia_agente_empresa, presence:true
  def nombres 
    self.nombre_1 + " " + self.nombre_2
  end
  
   validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d(\w\w\w|)/
    #eee555555eee
     validates_format_of :CURP, :with => /[A-Z][A-Z][A-Z][A-Z]\d\d\d\d\d\d[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z]\w\w/
     #BEML920313HCMLNS09.
    
    def padre 
        if self.referencia_agente_empresa.nil?
            return nil
        elsif self.agente_empresa
          return  Agent.where(id:self.referencia_agente_empresa)[0]
        else
          return  Company.where(id:self.referencia_agente_empresa)[0]
        end
    end
    def self.create_customer_from_credit(val)
        Customer.create(val.attributes.except(:pdf64,:destination_id,:casa_color,:cancel_o_porton,:color_de_cancel,:caracteristicas_especiales,:antiguedad_laboral_meses,:antiguedad_laboral_anos,:product_id,:antiguedad_en_el_domicilio_anterior_anos,:antiguedad_en_el_domicilio_anterior_meses,:antiguedad_en_el_domicilio_actual_meses,:antiguedad_en_el_domicilio_actual_anos,:fecha,:es_cliente,:monto_solicitud,:cada_cuanto_se_realizara_el_pago,:lugar_donde_se_realizara_el_pago))
    end
    def nombre_completo_deudor
        "#{apellido_paterno} #{apellido_materno} #{nombre_1} #{nombre_2}"
    end
    #def self.get_by_branch_office(datos,suc_id)
    #    array = []
    #    datos.all.each { |customer| array << customer if customer.padre.branch_office.id==suc_id.id }
    #    return array
    #end
   def self.get_by_branch_office(datos,suc_id)
        cad = ""
        co = 0
        datos.each do |customer| 
            if customer.padre.branch_office.id==suc_id.id
              cad = cad + " OR " unless co==0
              cad = cad + "customers.id = #{customer.id}"
              co=co+1
            end
        end
        return  (cad == "")? [] : Customer.where(cad) 
    end
  def domicilio
    cad = "#{calle}, #{numero_exterior}, "
    cad = cad + " #{numero_interior} " unless numero_interior.nil?
    cad =cad +"#{colonia}, #{codigo_postal}"
  end
   def estado_civil_cadena
        return case self.estado_civil
            when 0 
                "Soltero"
            when 1
                "Casado"
            when 2
                "Divorciado"
            when 3
                "Union libre"
            else
                "Viudo"
                
        end
                
    end
end
