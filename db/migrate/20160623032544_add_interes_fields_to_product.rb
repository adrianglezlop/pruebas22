class AddInteresFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :forma_de_pago_interes, :integer
    add_column :products, :plazo_de_prestamo_interes, :integer
    add_column :products, :numero_de_pagos_a_realizar_interes, :integer
  end
end
