json.array!(@products) do |product|
  json.extract! product, :id, :nombre_del_producto, :registro_del_contrado_de_adhesion, :plazo_de_prestamo, :numero_de_pagos_a_realizar, :taza_de_interes_ordinaria, :taza_de_interes_moratoria, :cat_sin_iva, :numero_de_meses_de_sueldo_para_prestamo, :comision_apert
  json.url product_url(product, format: :json)
end
