class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :clave
      t.string :nombre_del_agente
      t.string :apellido_materno
      t.string :apellido_paterno
      t.string :nombre_1
      t.string :nombre_2
      t.string :RFC
      t.string :calle
      t.integer :numero_interior
      t.integer :numero_exterior
      t.string :colonia
      t.integer :codigo_postal
      t.string :municipio
      t.string :estado
      t.string :CURP
      t.string :seguro_social
      t.string :INE
      t.string :nacionalidad
      t.date :fecha_de_nacimiento
      t.string :ciudad_de_nacimiento
      t.string :estado_de_nacimiento
      t.string :pais_de_nacimiento
      t.boolean :sexo
      t.string :telefono_de_casa
      t.string :telefono_celular
      t.string :correo_electronico_1
      t.string :correo_electronico_2
      t.string :cuenta_bancaria
      t.string :banco
      t.decimal :comision_por_cobranza
      t.decimal :comision_por_colocacion
      t.decimal :monto_maximo_de_prestamo
      t.boolean :permitir_prestamo_multiple

      t.timestamps null: false
    end
  end
end
