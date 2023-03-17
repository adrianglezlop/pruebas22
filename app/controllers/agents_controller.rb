class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    suc = params[:sucursal].to_i
    @agents = Agent.all.order(:nombre_del_agente)
    @agents = @agents.where(branch_office_id:suc) unless params[:sucursal].nil? or params[:sucursal] == ""
    
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)
    respond_to do |format|
      if @agent.save
        format.html { redirect_to @agent, notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:branch_office_id,:clave, :nombre_del_agente, :apellido_materno, :apellido_paterno, :nombre_1, :nombre_2, :RFC, :calle, :numero_interior, :numero_exterior, :colonia, :codigo_postal, :municipio, :estado, :CURP, :seguro_social, :INE, :nacionalidad, :fecha_de_nacimiento, :ciudad_de_nacimiento, :estado_de_nacimiento, :pais_de_nacimiento, :sexo, :telefono_de_casa, :telefono_celular, :correo_electronico_1, :correo_electronico_2, :cuenta_bancaria, :banco, :comision_por_cobranza, :comision_por_colocacion, :monto_maximo_de_prestamo, :permitir_prestamo_multiple)
    end
end
