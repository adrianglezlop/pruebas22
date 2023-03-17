class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.boolean :agente_empresa
      t.integer :referencia_agenteEmpresa
      t.text :como_se_entero
      t.boolean :familiar_con_prestamo
      t.string :nombre_completo_familiar_1
      t.string :parentesco_1
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :nombre_1
      t.string :nombre_2
      t.string :RFC
      t.string :CURP
      t.string :seguro
      t.string :INE
      t.string :nacionalidad
      t.date :fecha_de_nacimiento
      t.string :ciudad_de_nacimiento
      t.string :estado_de_nacimiento
      t.boolean :sexo
      t.string :telefono_de_casa
      t.string :telefono_celular
      t.string :email_1
      t.string :email_2
      t.integer :escolaridad
      t.integer :numero_de_dependientes_economicos
      t.decimal :gasto_promedio_mensual
      t.integer :estado_civil
      t.string :apellido_paterno_del_conyuge
      t.string :apellido_materno_del_conyuge
      t.string :nombre_1_del_conyuge
      t.string :nombre_2_del_conyuge
      t.string :telefono_celular_del_conyuge
      t.string :telefono_de_oficina_del_conyuge
      t.string :calle
      t.integer :numero_interior
      t.integer :numero_exterior
      t.integer :tipo_de_domicilio
      t.integer :codigo_postal
      t.string :colonia
      t.string :municipio
      t.string :antiguedad_en_el_domicilio_actual
      t.string :antiguedad_en_el_domicilio_anterior
      t.string :empresa_donde_labora
      t.string :giro_de_la_empresa
      t.string :puesto
      t.string :telefono_empresa
      t.string :antiguedad_laboral
      t.string :sueldo_mensual_neto
      t.string :dirreccion_empresa
      t.string :colonia_empresa
      t.string :municipio_empresa
      t.string :nombre_referencia_1
      t.string :domicilio_referencia_1
      t.string :telefono_fijo_referencia_1
      t.string :telefono_celular_referencia_1
      t.string :nombre_referencia_2
      t.string :domicilio_referencia_2
      t.string :telefono_fijo_referencia_2
      t.string :telefono_celular_referencia_2
      t.string :nombre_referencia_familiar
      t.string :domicilio_referencia_familiar
      t.string :telefono_fijo_referencia_familiar
      t.string :telefono_celular_referencia_familiar
      t.string :nombre_completo_familiar_2
      t.string :parentesco_2
      t.string :nombre_completo_1
      t.integer :edad_1
      t.string :parentesco_del_dependiente_1
      t.string :nombre_completo_2
      t.integer :edad_2
      t.string :parentesco_del_dependiente_2
      t.string :nombre_completo_3
      t.integer :edad_3
      t.string :parentesco_del_dependiente_3
      t.integer :status
      t.references :economical_activity, index: true, foreign_key: true
      t.string :nombre_completo_familiar_3
      t.string :parentesco_3
      t.string :nombre_completo_familiar_4
      t.string :parentesco_4
      t.string :nombre_completo_4
      t.string :edad_4
      t.string :parentesco_del_dependiente_4
      t.string :estado_actual
      t.string :localidad
      t.text :observaciones
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
