require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { CURP: @customer.CURP, INE: @customer.INE, RFC: @customer.RFC, agente_empresa: @customer.agente_empresa, antiguedad_en_el_domicilio_actual: @customer.antiguedad_en_el_domicilio_actual, antiguedad_en_el_domicilio_anterior: @customer.antiguedad_en_el_domicilio_anterior, antiguedad_laboral: @customer.antiguedad_laboral, apellido_materno: @customer.apellido_materno, apellido_materno_del_conyuge: @customer.apellido_materno_del_conyuge, apellido_paterno: @customer.apellido_paterno, apellido_paterno_del_conyuge: @customer.apellido_paterno_del_conyuge, calle: @customer.calle, ciudad_de_nacimiento: @customer.ciudad_de_nacimiento, codigo_postal: @customer.codigo_postal, colonia: @customer.colonia, colonia_empresa: @customer.colonia_empresa, como_se_entero: @customer.como_se_entero, country_id: @customer.country_id, dirreccion_empresa: @customer.dirreccion_empresa, domicilio_referencia_1: @customer.domicilio_referencia_1, domicilio_referencia_2: @customer.domicilio_referencia_2, domicilio_referencia_familiar: @customer.domicilio_referencia_familiar, economical_activity_id: @customer.economical_activity_id, edad_1: @customer.edad_1, edad_2: @customer.edad_2, edad_3: @customer.edad_3, edad_4: @customer.edad_4, email_1: @customer.email_1, email_2: @customer.email_2, empresa_donde_labora: @customer.empresa_donde_labora, escolaridad: @customer.escolaridad, estado_actual: @customer.estado_actual, estado_civil: @customer.estado_civil, estado_de_nacimiento: @customer.estado_de_nacimiento, familiar_con_prestamo: @customer.familiar_con_prestamo, fecha_de_nacimiento: @customer.fecha_de_nacimiento, gasto_promedio_mensual: @customer.gasto_promedio_mensual, giro_de_la_empresa: @customer.giro_de_la_empresa, localidad: @customer.localidad, municipio: @customer.municipio, municipio_empresa: @customer.municipio_empresa, nacionalidad: @customer.nacionalidad, nombre_1: @customer.nombre_1, nombre_1_del_conyuge: @customer.nombre_1_del_conyuge, nombre_2: @customer.nombre_2, nombre_2_del_conyuge: @customer.nombre_2_del_conyuge, nombre_completo_1: @customer.nombre_completo_1, nombre_completo_2: @customer.nombre_completo_2, nombre_completo_3: @customer.nombre_completo_3, nombre_completo_4: @customer.nombre_completo_4, nombre_completo_familiar_1: @customer.nombre_completo_familiar_1, nombre_completo_familiar_2: @customer.nombre_completo_familiar_2, nombre_completo_familiar_3: @customer.nombre_completo_familiar_3, nombre_completo_familiar_4: @customer.nombre_completo_familiar_4, nombre_referencia_1: @customer.nombre_referencia_1, nombre_referencia_2: @customer.nombre_referencia_2, nombre_referencia_familiar: @customer.nombre_referencia_familiar, numero_de_dependientes_economicos: @customer.numero_de_dependientes_economicos, numero_exterior: @customer.numero_exterior, numero_interior: @customer.numero_interior, observaciones: @customer.observaciones, parentesco_1: @customer.parentesco_1, parentesco_2: @customer.parentesco_2, parentesco_3: @customer.parentesco_3, parentesco_4: @customer.parentesco_4, parentesco_del_dependiente_1: @customer.parentesco_del_dependiente_1, parentesco_del_dependiente_2: @customer.parentesco_del_dependiente_2, parentesco_del_dependiente_3: @customer.parentesco_del_dependiente_3, parentesco_del_dependiente_4: @customer.parentesco_del_dependiente_4, puesto: @customer.puesto, referencia_agenteEmpresa: @customer.referencia_agenteEmpresa, seguro: @customer.seguro, sexo: @customer.sexo, status: @customer.status, sueldo_mensual_neto: @customer.sueldo_mensual_neto, telefono_celular: @customer.telefono_celular, telefono_celular_del_conyuge: @customer.telefono_celular_del_conyuge, telefono_celular_referencia_1: @customer.telefono_celular_referencia_1, telefono_celular_referencia_2: @customer.telefono_celular_referencia_2, telefono_celular_referencia_familiar: @customer.telefono_celular_referencia_familiar, telefono_de_casa: @customer.telefono_de_casa, telefono_de_oficina_del_conyuge: @customer.telefono_de_oficina_del_conyuge, telefono_empresa: @customer.telefono_empresa, telefono_fijo_referencia_1: @customer.telefono_fijo_referencia_1, telefono_fijo_referencia_2: @customer.telefono_fijo_referencia_2, telefono_fijo_referencia_familiar: @customer.telefono_fijo_referencia_familiar, tipo_de_domicilio: @customer.tipo_de_domicilio }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { CURP: @customer.CURP, INE: @customer.INE, RFC: @customer.RFC, agente_empresa: @customer.agente_empresa, antiguedad_en_el_domicilio_actual: @customer.antiguedad_en_el_domicilio_actual, antiguedad_en_el_domicilio_anterior: @customer.antiguedad_en_el_domicilio_anterior, antiguedad_laboral: @customer.antiguedad_laboral, apellido_materno: @customer.apellido_materno, apellido_materno_del_conyuge: @customer.apellido_materno_del_conyuge, apellido_paterno: @customer.apellido_paterno, apellido_paterno_del_conyuge: @customer.apellido_paterno_del_conyuge, calle: @customer.calle, ciudad_de_nacimiento: @customer.ciudad_de_nacimiento, codigo_postal: @customer.codigo_postal, colonia: @customer.colonia, colonia_empresa: @customer.colonia_empresa, como_se_entero: @customer.como_se_entero, country_id: @customer.country_id, dirreccion_empresa: @customer.dirreccion_empresa, domicilio_referencia_1: @customer.domicilio_referencia_1, domicilio_referencia_2: @customer.domicilio_referencia_2, domicilio_referencia_familiar: @customer.domicilio_referencia_familiar, economical_activity_id: @customer.economical_activity_id, edad_1: @customer.edad_1, edad_2: @customer.edad_2, edad_3: @customer.edad_3, edad_4: @customer.edad_4, email_1: @customer.email_1, email_2: @customer.email_2, empresa_donde_labora: @customer.empresa_donde_labora, escolaridad: @customer.escolaridad, estado_actual: @customer.estado_actual, estado_civil: @customer.estado_civil, estado_de_nacimiento: @customer.estado_de_nacimiento, familiar_con_prestamo: @customer.familiar_con_prestamo, fecha_de_nacimiento: @customer.fecha_de_nacimiento, gasto_promedio_mensual: @customer.gasto_promedio_mensual, giro_de_la_empresa: @customer.giro_de_la_empresa, localidad: @customer.localidad, municipio: @customer.municipio, municipio_empresa: @customer.municipio_empresa, nacionalidad: @customer.nacionalidad, nombre_1: @customer.nombre_1, nombre_1_del_conyuge: @customer.nombre_1_del_conyuge, nombre_2: @customer.nombre_2, nombre_2_del_conyuge: @customer.nombre_2_del_conyuge, nombre_completo_1: @customer.nombre_completo_1, nombre_completo_2: @customer.nombre_completo_2, nombre_completo_3: @customer.nombre_completo_3, nombre_completo_4: @customer.nombre_completo_4, nombre_completo_familiar_1: @customer.nombre_completo_familiar_1, nombre_completo_familiar_2: @customer.nombre_completo_familiar_2, nombre_completo_familiar_3: @customer.nombre_completo_familiar_3, nombre_completo_familiar_4: @customer.nombre_completo_familiar_4, nombre_referencia_1: @customer.nombre_referencia_1, nombre_referencia_2: @customer.nombre_referencia_2, nombre_referencia_familiar: @customer.nombre_referencia_familiar, numero_de_dependientes_economicos: @customer.numero_de_dependientes_economicos, numero_exterior: @customer.numero_exterior, numero_interior: @customer.numero_interior, observaciones: @customer.observaciones, parentesco_1: @customer.parentesco_1, parentesco_2: @customer.parentesco_2, parentesco_3: @customer.parentesco_3, parentesco_4: @customer.parentesco_4, parentesco_del_dependiente_1: @customer.parentesco_del_dependiente_1, parentesco_del_dependiente_2: @customer.parentesco_del_dependiente_2, parentesco_del_dependiente_3: @customer.parentesco_del_dependiente_3, parentesco_del_dependiente_4: @customer.parentesco_del_dependiente_4, puesto: @customer.puesto, referencia_agenteEmpresa: @customer.referencia_agenteEmpresa, seguro: @customer.seguro, sexo: @customer.sexo, status: @customer.status, sueldo_mensual_neto: @customer.sueldo_mensual_neto, telefono_celular: @customer.telefono_celular, telefono_celular_del_conyuge: @customer.telefono_celular_del_conyuge, telefono_celular_referencia_1: @customer.telefono_celular_referencia_1, telefono_celular_referencia_2: @customer.telefono_celular_referencia_2, telefono_celular_referencia_familiar: @customer.telefono_celular_referencia_familiar, telefono_de_casa: @customer.telefono_de_casa, telefono_de_oficina_del_conyuge: @customer.telefono_de_oficina_del_conyuge, telefono_empresa: @customer.telefono_empresa, telefono_fijo_referencia_1: @customer.telefono_fijo_referencia_1, telefono_fijo_referencia_2: @customer.telefono_fijo_referencia_2, telefono_fijo_referencia_familiar: @customer.telefono_fijo_referencia_familiar, tipo_de_domicilio: @customer.tipo_de_domicilio }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
