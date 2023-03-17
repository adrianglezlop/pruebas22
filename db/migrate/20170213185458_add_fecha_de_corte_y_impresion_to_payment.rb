class AddFechaDeCorteYImpresionToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :fecha_de_corte, :date
    add_column :payments, :fecha_de_impresion, :date
  end
end
