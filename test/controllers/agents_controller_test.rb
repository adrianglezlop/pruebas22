require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agent" do
    assert_difference('Agent.count') do
      post :create, agent: { CURP: @agent.CURP, INE: @agent.INE, RFC: @agent.RFC, apellido_materno: @agent.apellido_materno, apellido_paterno: @agent.apellido_paterno, banco: @agent.banco, calle: @agent.calle, ciudad_de_nacimiento: @agent.ciudad_de_nacimiento, clave: @agent.clave, codigo_postal: @agent.codigo_postal, colonia: @agent.colonia, comision_por_cobranza: @agent.comision_por_cobranza, comision_por_colocacion: @agent.comision_por_colocacion, correo_electronico_1: @agent.correo_electronico_1, correo_electronico_2: @agent.correo_electronico_2, cuenta_bancaria: @agent.cuenta_bancaria, estado: @agent.estado, estado_de_nacimiento: @agent.estado_de_nacimiento, fecha_de_nacimiento: @agent.fecha_de_nacimiento, monto_maximo_de_prestamo: @agent.monto_maximo_de_prestamo, municipio: @agent.municipio, nacionalidad: @agent.nacionalidad, nombre_1: @agent.nombre_1, nombre_2: @agent.nombre_2, nombre_del_agente: @agent.nombre_del_agente, numero_exterior: @agent.numero_exterior, numero_interior: @agent.numero_interior, pais_de_nacimiento: @agent.pais_de_nacimiento, permitir_prestamo_multiple: @agent.permitir_prestamo_multiple, seguro_social: @agent.seguro_social, sexo: @agent.sexo, telefono_celular: @agent.telefono_celular, telefono_de_casa: @agent.telefono_de_casa }
    end

    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should show agent" do
    get :show, id: @agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agent
    assert_response :success
  end

  test "should update agent" do
    patch :update, id: @agent, agent: { CURP: @agent.CURP, INE: @agent.INE, RFC: @agent.RFC, apellido_materno: @agent.apellido_materno, apellido_paterno: @agent.apellido_paterno, banco: @agent.banco, calle: @agent.calle, ciudad_de_nacimiento: @agent.ciudad_de_nacimiento, clave: @agent.clave, codigo_postal: @agent.codigo_postal, colonia: @agent.colonia, comision_por_cobranza: @agent.comision_por_cobranza, comision_por_colocacion: @agent.comision_por_colocacion, correo_electronico_1: @agent.correo_electronico_1, correo_electronico_2: @agent.correo_electronico_2, cuenta_bancaria: @agent.cuenta_bancaria, estado: @agent.estado, estado_de_nacimiento: @agent.estado_de_nacimiento, fecha_de_nacimiento: @agent.fecha_de_nacimiento, monto_maximo_de_prestamo: @agent.monto_maximo_de_prestamo, municipio: @agent.municipio, nacionalidad: @agent.nacionalidad, nombre_1: @agent.nombre_1, nombre_2: @agent.nombre_2, nombre_del_agente: @agent.nombre_del_agente, numero_exterior: @agent.numero_exterior, numero_interior: @agent.numero_interior, pais_de_nacimiento: @agent.pais_de_nacimiento, permitir_prestamo_multiple: @agent.permitir_prestamo_multiple, seguro_social: @agent.seguro_social, sexo: @agent.sexo, telefono_celular: @agent.telefono_celular, telefono_de_casa: @agent.telefono_de_casa }
    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should destroy agent" do
    assert_difference('Agent.count', -1) do
      delete :destroy, id: @agent
    end

    assert_redirected_to agents_path
  end
end
