require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { cat_sin_iva: @product.cat_sin_iva, nombre_del_producto: @product.nombre_del_producto, numero_de_meses_de_sueldo_para_prestemo: @product.numero_de_meses_de_sueldo_para_prestemo, numero_de_pagos_a_realizar: @product.numero_de_pagos_a_realizar, plazo_de_prestamo: @product.plazo_de_prestamo, registro_del_contrado_de_adhesion: @product.registro_del_contrado_de_adhesion, taza_de_interes_moratoria: @product.taza_de_interes_moratoria, taza_de_interes_ordinaria: @product.taza_de_interes_ordinaria }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { cat_sin_iva: @product.cat_sin_iva, nombre_del_producto: @product.nombre_del_producto, numero_de_meses_de_sueldo_para_prestemo: @product.numero_de_meses_de_sueldo_para_prestemo, numero_de_pagos_a_realizar: @product.numero_de_pagos_a_realizar, plazo_de_prestamo: @product.plazo_de_prestamo, registro_del_contrado_de_adhesion: @product.registro_del_contrado_de_adhesion, taza_de_interes_moratoria: @product.taza_de_interes_moratoria, taza_de_interes_ordinaria: @product.taza_de_interes_ordinaria }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
