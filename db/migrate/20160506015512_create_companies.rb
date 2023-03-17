class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :clave
      t.string :nombre_de_empresa
      t.string :razon_social
      t.string :calle
      t.integer :numero_exterior
      t.integer :numero_interior
      t.string :colonia
      t.integer :codigo_postal
      t.string :municipio
      t.string :estado
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :nombre_1
      t.string :nombre_2
      t.string :telefono_de_oficina
      t.string :telefono_celular
      t.string :correo_electronico_1
      t.string :correo_electronico_2
      t.string :cuenta_bacaria
      t.string :banco
      t.decimal :comicion_por_cobranza
      t.decimal :comicion_por_colocacion
      t.decimal :monto_maximo_de_prestamo
      t.boolean :permitir_prestamo_multiple

      t.timestamps null: false
    end
  end
end
