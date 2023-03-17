require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { apellido_materno: @company.apellido_materno, apellido_paterno: @company.apellido_paterno, banco: @company.banco, calle: @company.calle, clave: @company.clave, codigo_postal: @company.codigo_postal, colonia: @company.colonia, comicion_por_cobranza: @company.comicion_por_cobranza, comicion_por_colocacion: @company.comicion_por_colocacion, correo_electronico_1: @company.correo_electronico_1, correo_electronico_2: @company.correo_electronico_2, cuenta_bacaria: @company.cuenta_bacaria, estado: @company.estado, monto_maximo_de_prestamo: @company.monto_maximo_de_prestamo, municipio: @company.municipio, nombre_1: @company.nombre_1, nombre_2: @company.nombre_2, nombre_de_empresa: @company.nombre_de_empresa, numero_exterior: @company.numero_exterior, numero_interior: @company.numero_interior, permitir_prestamo_multiple: @company.permitir_prestamo_multiple, razon_social: @company.razon_social, telefono_celular: @company.telefono_celular, telefono_de_oficina: @company.telefono_de_oficina }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { apellido_materno: @company.apellido_materno, apellido_paterno: @company.apellido_paterno, banco: @company.banco, calle: @company.calle, clave: @company.clave, codigo_postal: @company.codigo_postal, colonia: @company.colonia, comicion_por_cobranza: @company.comicion_por_cobranza, comicion_por_colocacion: @company.comicion_por_colocacion, correo_electronico_1: @company.correo_electronico_1, correo_electronico_2: @company.correo_electronico_2, cuenta_bacaria: @company.cuenta_bacaria, estado: @company.estado, monto_maximo_de_prestamo: @company.monto_maximo_de_prestamo, municipio: @company.municipio, nombre_1: @company.nombre_1, nombre_2: @company.nombre_2, nombre_de_empresa: @company.nombre_de_empresa, numero_exterior: @company.numero_exterior, numero_interior: @company.numero_interior, permitir_prestamo_multiple: @company.permitir_prestamo_multiple, razon_social: @company.razon_social, telefono_celular: @company.telefono_celular, telefono_de_oficina: @company.telefono_de_oficina }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
