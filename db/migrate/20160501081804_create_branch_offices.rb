class CreateBranchOffices < ActiveRecord::Migration
  def change
    create_table :branch_offices do |t|
      t.string :nombre
      t.string :calle
      t.integer :no_ext
      t.integer :no_int
      t.string :colonia
      t.integer :codigo_postal
      t.string :municipio
      t.string :estado
      t.string :telefono_oficina
      t.string :telefono_celular
      t.string :correo1
      t.string :correo2
      t.decimal :comision_por_colocacion
      t.decimal :comision_por_cobranza
      t.decimal :monto_maximo_adeudo_sucursal
      t.integer :formato_impresion

      t.timestamps null: false
    end
  end
end
