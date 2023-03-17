class CreateSeguimientos < ActiveRecord::Migration
  def change
    create_table :seguimientos do |t|
      t.string :nombre
      t.date :fecha_prestamo
      t.float :capital
      t.float :monto_a_cobrar
      t.float :adeudo
      t.float :a_pagar
      t.float :atrasado
      t.float :interés_moratorio
      t.float :total_a_cobrar
      t.float :cobrado
      t.float :diferencia
      t.float :adelantado
      t.string :empresa
      t.string :no_pago
      t.string :no_creditos

      t.timestamps null: false
    end
  end
end
