class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre_del_producto
      t.string :registro_del_contrado_de_adhesion
      t.string :plazo_de_prestamo
      t.integer :numero_de_pagos_a_realizar
      t.decimal :taza_de_interes_ordinaria
      t.decimal :taza_de_interes_moratoria
      t.decimal :cat_sin_iva
      t.decimal :numero_de_meses_de_sueldo_para_prestamo

      t.timestamps null: false
    end
  end
end
