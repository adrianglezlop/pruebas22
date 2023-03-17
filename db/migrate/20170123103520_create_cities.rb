class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :cve_estado
      t.string :dc_estado
      t.string :cve_localidad_inegi
      t.string :dc_localidad_inegi
      t.string :cve_municipio_siti_codigo_postal
      t.string :dc_municipio_siti
      t.string :cve_colonia_siti_colonia

      t.timestamps null: false
    end
  end
end
