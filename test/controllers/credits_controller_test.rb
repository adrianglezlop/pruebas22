require 'test_helper'

class CreditsControllerTest < ActionController::TestCase
  setup do
    @credit = credits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post :create, credit: { CURP: @credit.CURP, INE: @credit.INE, RFC: @credit.RFC, actividad_Econimica: @credit.actividad_Econimica, agente_Empresa: @credit.agente_Empresa, antiguedad_En_El_Domicilio_Actual: @credit.antiguedad_En_El_Domicilio_Actual, antiguedad_En_El_Domicilio_Anterior: @credit.antiguedad_En_El_Domicilio_Anterior, antiguedad_Laboral: @credit.antiguedad_Laboral, apellido_Materno: @credit.apellido_Materno, apellido_Materno_Del_Conyuge: @credit.apellido_Materno_Del_Conyuge, apellido_Paterno: @credit.apellido_Paterno, apellido_Paterno_Del_Conyuge: @credit.apellido_Paterno_Del_Conyuge, cada_Cuanto_Se_Realizara_El_Pago: @credit.cada_Cuanto_Se_Realizara_El_Pago, calle: @credit.calle, ciudad_De_Nacimiento: @credit.ciudad_De_Nacimiento, codigo_Postal: @credit.codigo_Postal, colonia: @credit.colonia, colonia_Empresa: @credit.colonia_Empresa, como_Se_Entero: @credit.como_Se_Entero, dirreccion_Empresa: @credit.dirreccion_Empresa, domicilio_Referencia_1: @credit.domicilio_Referencia_1, domicilio_Referencia_2: @credit.domicilio_Referencia_2, domicilio_Referencia_3: @credit.domicilio_Referencia_3, domicilio_Referencia_Familiar: @credit.domicilio_Referencia_Familiar, email_1: @credit.email_1, email_2: @credit.email_2, empresa_Donde_Labora: @credit.empresa_Donde_Labora, es_Cliente: @credit.es_Cliente, escolaridad: @credit.escolaridad, estado_Actual: @credit.estado_Actual, estado_Civil: @credit.estado_Civil, estado_De_Nacimiento: @credit.estado_De_Nacimiento, familiar_Con_Prestamo: @credit.familiar_Con_Prestamo, fecha: @credit.fecha, fecha_De_Nacimiento: @credit.fecha_De_Nacimiento, fecha_De_Nacimiento: @credit.fecha_De_Nacimiento, gasto_Promedio_Mensual: @credit.gasto_Promedio_Mensual, giro_De_La_Empresa: @credit.giro_De_La_Empresa, localidad: @credit.localidad, lugar_Donde_Se_Realizara_El_Pago: @credit.lugar_Donde_Se_Realizara_El_Pago, monto_Solicitud: @credit.monto_Solicitud, municipio: @credit.municipio, municipio_Empresa: @credit.municipio_Empresa, nacionalidad: @credit.nacionalidad, nombre_1: @credit.nombre_1, nombre_1_Del_Conyuge: @credit.nombre_1_Del_Conyuge, nombre_2: @credit.nombre_2, nombre_2_Del_Conyuge: @credit.nombre_2_Del_Conyuge, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Referencia_1: @credit.nombre_Referencia_1, nombre_Referencia_2: @credit.nombre_Referencia_2, nombre_Referencia_3: @credit.nombre_Referencia_3, nombre_Referencia_Familiar: @credit.nombre_Referencia_Familiar, numero_De_Dependientes_Economicos: @credit.numero_De_Dependientes_Economicos, numero_Exterior: @credit.numero_Exterior, numero_Interior: @credit.numero_Interior, pais_De_Nacimiento: @credit.pais_De_Nacimiento, parentesco1: @credit.parentesco1, parentesco_1: @credit.parentesco_1, parentesco_1: @credit.parentesco_1, puesto: @credit.puesto, referencia_AgenteEmpresa: @credit.referencia_AgenteEmpresa, seguro: @credit.seguro, sexo: @credit.sexo, sueldo_Mensual_Neto: @credit.sueldo_Mensual_Neto, telefono_Celular: @credit.telefono_Celular, telefono_Celular_Del_Conyuge: @credit.telefono_Celular_Del_Conyuge, telefono_Celular_Referencia_1: @credit.telefono_Celular_Referencia_1, telefono_Celular_Referencia_2: @credit.telefono_Celular_Referencia_2, telefono_Celular_Referencia_3: @credit.telefono_Celular_Referencia_3, telefono_Celular_Referencia_Familiar: @credit.telefono_Celular_Referencia_Familiar, telefono_De_Casa: @credit.telefono_De_Casa, telefono_De_Oficina_Del_Conyuge: @credit.telefono_De_Oficina_Del_Conyuge, telefono_Empresa: @credit.telefono_Empresa, telefono_Fijo_Referencia_1: @credit.telefono_Fijo_Referencia_1, telefono_Fijo_Referencia_2: @credit.telefono_Fijo_Referencia_2, telefono_Fijo_Referencia_3: @credit.telefono_Fijo_Referencia_3, telefono_Fijo_Referencia_Familiar: @credit.telefono_Fijo_Referencia_Familiar, tipo_De_Domicilio: @credit.tipo_De_Domicilio }
    end

    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should show credit" do
    get :show, id: @credit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit
    assert_response :success
  end

  test "should update credit" do
    patch :update, id: @credit, credit: { CURP: @credit.CURP, INE: @credit.INE, RFC: @credit.RFC, actividad_Econimica: @credit.actividad_Econimica, agente_Empresa: @credit.agente_Empresa, antiguedad_En_El_Domicilio_Actual: @credit.antiguedad_En_El_Domicilio_Actual, antiguedad_En_El_Domicilio_Anterior: @credit.antiguedad_En_El_Domicilio_Anterior, antiguedad_Laboral: @credit.antiguedad_Laboral, apellido_Materno: @credit.apellido_Materno, apellido_Materno_Del_Conyuge: @credit.apellido_Materno_Del_Conyuge, apellido_Paterno: @credit.apellido_Paterno, apellido_Paterno_Del_Conyuge: @credit.apellido_Paterno_Del_Conyuge, cada_Cuanto_Se_Realizara_El_Pago: @credit.cada_Cuanto_Se_Realizara_El_Pago, calle: @credit.calle, ciudad_De_Nacimiento: @credit.ciudad_De_Nacimiento, codigo_Postal: @credit.codigo_Postal, colonia: @credit.colonia, colonia_Empresa: @credit.colonia_Empresa, como_Se_Entero: @credit.como_Se_Entero, dirreccion_Empresa: @credit.dirreccion_Empresa, domicilio_Referencia_1: @credit.domicilio_Referencia_1, domicilio_Referencia_2: @credit.domicilio_Referencia_2, domicilio_Referencia_3: @credit.domicilio_Referencia_3, domicilio_Referencia_Familiar: @credit.domicilio_Referencia_Familiar, email_1: @credit.email_1, email_2: @credit.email_2, empresa_Donde_Labora: @credit.empresa_Donde_Labora, es_Cliente: @credit.es_Cliente, escolaridad: @credit.escolaridad, estado_Actual: @credit.estado_Actual, estado_Civil: @credit.estado_Civil, estado_De_Nacimiento: @credit.estado_De_Nacimiento, familiar_Con_Prestamo: @credit.familiar_Con_Prestamo, fecha: @credit.fecha, fecha_De_Nacimiento: @credit.fecha_De_Nacimiento, fecha_De_Nacimiento: @credit.fecha_De_Nacimiento, gasto_Promedio_Mensual: @credit.gasto_Promedio_Mensual, giro_De_La_Empresa: @credit.giro_De_La_Empresa, localidad: @credit.localidad, lugar_Donde_Se_Realizara_El_Pago: @credit.lugar_Donde_Se_Realizara_El_Pago, monto_Solicitud: @credit.monto_Solicitud, municipio: @credit.municipio, municipio_Empresa: @credit.municipio_Empresa, nacionalidad: @credit.nacionalidad, nombre_1: @credit.nombre_1, nombre_1_Del_Conyuge: @credit.nombre_1_Del_Conyuge, nombre_2: @credit.nombre_2, nombre_2_Del_Conyuge: @credit.nombre_2_Del_Conyuge, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Completo_Familiar_1: @credit.nombre_Completo_Familiar_1, nombre_Referencia_1: @credit.nombre_Referencia_1, nombre_Referencia_2: @credit.nombre_Referencia_2, nombre_Referencia_3: @credit.nombre_Referencia_3, nombre_Referencia_Familiar: @credit.nombre_Referencia_Familiar, numero_De_Dependientes_Economicos: @credit.numero_De_Dependientes_Economicos, numero_Exterior: @credit.numero_Exterior, numero_Interior: @credit.numero_Interior, pais_De_Nacimiento: @credit.pais_De_Nacimiento, parentesco1: @credit.parentesco1, parentesco_1: @credit.parentesco_1, parentesco_1: @credit.parentesco_1, puesto: @credit.puesto, referencia_AgenteEmpresa: @credit.referencia_AgenteEmpresa, seguro: @credit.seguro, sexo: @credit.sexo, sueldo_Mensual_Neto: @credit.sueldo_Mensual_Neto, telefono_Celular: @credit.telefono_Celular, telefono_Celular_Del_Conyuge: @credit.telefono_Celular_Del_Conyuge, telefono_Celular_Referencia_1: @credit.telefono_Celular_Referencia_1, telefono_Celular_Referencia_2: @credit.telefono_Celular_Referencia_2, telefono_Celular_Referencia_3: @credit.telefono_Celular_Referencia_3, telefono_Celular_Referencia_Familiar: @credit.telefono_Celular_Referencia_Familiar, telefono_De_Casa: @credit.telefono_De_Casa, telefono_De_Oficina_Del_Conyuge: @credit.telefono_De_Oficina_Del_Conyuge, telefono_Empresa: @credit.telefono_Empresa, telefono_Fijo_Referencia_1: @credit.telefono_Fijo_Referencia_1, telefono_Fijo_Referencia_2: @credit.telefono_Fijo_Referencia_2, telefono_Fijo_Referencia_3: @credit.telefono_Fijo_Referencia_3, telefono_Fijo_Referencia_Familiar: @credit.telefono_Fijo_Referencia_Familiar, tipo_De_Domicilio: @credit.tipo_De_Domicilio }
    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete :destroy, id: @credit
    end

    assert_redirected_to credits_path
  end
end
