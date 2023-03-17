require 'test_helper'

class BranchOfficesControllerTest < ActionController::TestCase
  setup do
    @branch_office = branch_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:branch_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create branch_office" do
    assert_difference('BranchOffice.count') do
      post :create, branch_office: { calle: @branch_office.calle, codigo_postal: @branch_office.codigo_postal, colonia: @branch_office.colonia, comision_por_cobranza: @branch_office.comision_por_cobranza, comision_por_colocacion: @branch_office.comision_por_colocacion, correo1: @branch_office.correo1, correo2: @branch_office.correo2, estado: @branch_office.estado, formato_impresion: @branch_office.formato_impresion, monto_maximo_adeudo_sucursal: @branch_office.monto_maximo_adeudo_sucursal, municipio: @branch_office.municipio, no_ext: @branch_office.no_ext, no_int: @branch_office.no_int, nombre: @branch_office.nombre, telefono_celular: @branch_office.telefono_celular, telefono_oficina: @branch_office.telefono_oficina }
    end

    assert_redirected_to branch_office_path(assigns(:branch_office))
  end

  test "should show branch_office" do
    get :show, id: @branch_office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @branch_office
    assert_response :success
  end

  test "should update branch_office" do
    patch :update, id: @branch_office, branch_office: { calle: @branch_office.calle, codigo_postal: @branch_office.codigo_postal, colonia: @branch_office.colonia, comision_por_cobranza: @branch_office.comision_por_cobranza, comision_por_colocacion: @branch_office.comision_por_colocacion, correo1: @branch_office.correo1, correo2: @branch_office.correo2, estado: @branch_office.estado, formato_impresion: @branch_office.formato_impresion, monto_maximo_adeudo_sucursal: @branch_office.monto_maximo_adeudo_sucursal, municipio: @branch_office.municipio, no_ext: @branch_office.no_ext, no_int: @branch_office.no_int, nombre: @branch_office.nombre, telefono_celular: @branch_office.telefono_celular, telefono_oficina: @branch_office.telefono_oficina }
    assert_redirected_to branch_office_path(assigns(:branch_office))
  end

  test "should destroy branch_office" do
    assert_difference('BranchOffice.count', -1) do
      delete :destroy, id: @branch_office
    end

    assert_redirected_to branch_offices_path
  end
end
