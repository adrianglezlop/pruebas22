class ReportsController < ApplicationController
  def historial_de_recibos
     respond_to do |format|
        format.html {  }
        format.xlsx {
            @fecha = params[:fecha]
            id = params[:id]
            tipo = params[:tipo]
            @producto = params[:producto]
            unless params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
                if tipo.to_i==1
                  @padre =  Agent.find(id)
                else
                  @padre = Company.find(id)
                end
            end
            @tickets = Ticket.joins(:payment=>:credit).where(status:1).order('credits.agente_empresa, credits.referencia_agente_empresa,credits.fecha_de_contrato')
            @tickets = @tickets.where("payments.fecha_de_impresion = ?",@fecha.to_date) unless params[:fecha].nil? or params[:fecha]==""
            @tickets = @tickets.where("credits.product_id = ?",@producto) unless params[:producto].nil? or params[:producto]==""
            @tickets = @tickets.where("credits.agente_empresa = ? and credits.referencia_agente_empresa = ?",tipo,id) unless params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @producto = Product.find( @producto) unless params[:producto].nil? or params[:producto]==""
            
        }
    end
  end
  
  def calificaciones
    respond_to do |format|
        format.html {  }
        format.xlsx { 
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            branch_office_id = params[:sucursal_id]
            @branch_office = BranchOffice.find(branch_office_id) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
                if tipo_padre.to_i == 1
                    @padre = Agent.find(padre_id)
                else
                    @padre = Company.find(padre_id)
                end
            end
            @customers = Customer.all
            @customers = @customers.where("customers.agente_empresa = ? and customers.referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @customers = Customer.get_by_branch_office(@customers,@branch_office) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            @customers = @customers.order(:updated_at)  unless @customers == []   
        }
    end
  end

  def num_tablero
      @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @sucursales = BranchOffice.all.order("clave")
      @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
      #@sucursales = @sucursales.where("id<>10")
  end
  
 def vencidos
      @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @sucursales = BranchOffice.all
      @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
   
      @customers = Customer.all
      @customers = @customers.where("referencia_agente_empresa=20 and status=1")
 end 

 def estado_de_cuenta
    @customer = Customer.find(params[:c_id]) unless params[:c_id].nil? or params[:c_id]==""
   respond_to do |format|
        format.html {  }
        format.pdf {
            fechas = []
            
            params[:fecha2]
            fechas << params[:f1].to_date unless params[:f1].nil? or params[:f1]==""
            fechas << params[:f2].to_date unless params[:f2].nil? or params[:f2]==""
            if @product_id ==6
                pdf = EstadoDeCuentamunPdf.new(@customer,fechas)
            else
                pdf = EstadoDeCuentaPdf.new(@customer,fechas)
            end
            send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
        }
    end
 end
  

  def historial_de_pagos
     respond_to do |format|
        format.html {  }
        format.xlsx {
            @customer = Customer.find(params[:id])
            
        }
    end
  end
  
  def seguimiento_conf
        require 'json'
        unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil? or params[:producto].nil?
         @fecha = params[:fecha].to_date
         @padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
         @producto = params[:producto].to_i
         @resp = Hash.new("respuesta")
         @resp["nombre_empresa"] = @padre.nombre_completo
         @resp["fecha"] = @fecha
         @resp["datos"] = get_seguimiento_de_cobranza(@padre,@fecha,@producto)
        end
  end
 

  def seguimiento
    respond_to do |format|
        format.html {  }
        format.json { self.seguimiento_conf }
        format.xlsx{ 
            self.seguimiento_conf 
            @fecha_encabezado = params[:fecha_encabezado] unless params[:fecha_encabezado].nil? or params[:fecha_encabezado] == ""
        }
        
    end
  end

  def tablero_conf
        require 'json'
        unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil? or params[:producto].nil?
         @fecha = params[:fecha].to_date
         @padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
         @producto = params[:producto].to_i
         @resp = Hash.new("respuesta")
         @resp["nombre_empresa"] = @padre.nombre_completo
         @resp["fecha"] = @fecha
         @resp["datos"] = get_seguimiento_tablero(@padre,@fecha,@producto)
        end
  end
  
  def tablero
      
    respond_to do |format|
        format.html {  }
        format.json { self.tablero_conf }
        format.xlsx{ 
            self.tablero_conf 
            @fecha_encabezado = params[:fecha_encabezado] unless params[:fecha_encabezado].nil? or params[:fecha_encabezado] == ""
        }
        
    end
  end
  
  def seguimiento_quincenal
    respond_to do |format|
        format.html {  }
        format.json { 
            self.seguimiento_conf
            @resp["datos"] = Auxiliar.seguimiento_quincenal(@padre,@fecha,@producto)
        }
        format.xlsx{ 
            self.seguimiento_conf 
            @resp["datos"] = Auxiliar.seguimiento_quincenal(@padre,@fecha,@producto)
            @fecha_encabezado = params[:fecha_encabezado] unless params[:fecha_encabezado].nil? or params[:fecha_encabezado] == ""
        }
        
    end
  end
  
  def cobranza
    respond_to do |format|
        format.html {  }
        format.xlsx{
            if current_user.tipo == 3
                branch_office_id = current_user.branchOffices[0].id
            end
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            product_id = params[:producto]
            branch_office_id = params[:sucursal_id]
            fecha1 = params[:fecha1]
            fecha2 = params[:fecha2]
            @tickets =  Ticket.joins(:payment => :credit).select("tickets.*, credits.agente_empresa, credits.referencia_agente_empresa, credits.product_id,credits.id ").where(status:0)  
            
            @tickets = @tickets.where("credits.agente_empresa = ? and credits.referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @tickets = @tickets.where(:updated_at => fecha1.to_date.beginning_of_day..fecha2.to_date.end_of_day) unless params[:fecha1].nil? or params[:fecha1]=="" or params[:fecha2].nil? or params[:fecha2]==""
            @tickets = @tickets.where("credits.product_id = ? ",product_id) unless params[:producto].nil? or params[:producto]==""
            @tickets = @tickets.order(:updated_at)
        }
    end
  end
  
 
  def pronostico_de_cobranza
      @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @sucursales = BranchOffice.all
      @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
  end
  
  def clientes
      respond_to do |format|
        format.html {  }
        format.xlsx { 
            @sucursales = BranchOffice.all
            @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
            @customers = Customer.all
            @customers = Customer.get_by_branch_office(@customers,BranchOffice.find(params[:sucursal].to_i)) unless params[:sucursal].nil? or params[:sucursal] ==""  
        }
    end
      
  end
  
  def get_seguimiento_de_cobranza(padre,fecha,producto)
    Auxiliar.seguimiento(padre,fecha,producto)
  end
  
  def get_seguimiento_tablero(padre,fecha,producto)
    Auxiliar.tablero(padre,fecha,producto)
  end
  
  
  def usuarios
     @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @users = User.all
      @users = @users.order(:tipo)
      
  end
  
  def agentes
      @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @agents = Agent.all
      @agents = @agents.order(:id)
  end
  

  def dtkta_clientes
      respond_to do |format|
        format.html {  }
        format.xlsx { 
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            branch_office_id = params[:sucursal_id]
            @branch_office = BranchOffice.find(branch_office_id) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
                if tipo_padre.to_i == 1
                    @padre = Agent.find(padre_id)
                else
                    @padre = Company.find(padre_id)
                end
            end
            @customers = Customer.all
            @customers = @customers.where("customers.agente_empresa = ? and customers.referencia_agente_empresa = ?",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @customers = Customer.get_by_branch_office(@customers,@branch_office) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            @customers = @customers.order(:updated_at)  unless @customers == []   
        }
    end
  end
  
  def dtkta_cuentas
      respond_to do |format|
        format.html {  }
        format.xlsx { 
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            branch_office_id = params[:sucursal_id]
            @branch_office = BranchOffice.find(branch_office_id) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
                if tipo_padre.to_i == 1
                    @padre = Agent.find(padre_id)
                else
                    @padre = Company.find(padre_id)
                end
            end
            #@customers = Customer.all
            #@customers = @customers.where("customers.agente_empresa = ? and customers.referencia_agente_empresa = ?",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            #@customers = Customer.get_by_branch_office(@customers,@branch_office) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            #@customers = @customers.order(:updated_at)  unless @customers == []   
            @credits = Credit.all
            @credits = @credits.where("credits.referencia_agente_empresa = ?",padre_id) unless params[:id].nil? or  params[:id]==""
            #@credits = @credits.order(:updated_at)  unless @credits == [] 
        }
    end
  end

end 