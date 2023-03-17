class CreateLocalidadCnbvs < ActiveRecord::Migration
  def change
    create_table :localidad_cnbvs do |t|
      t.integer :clave
      t.string :descripcion
      t.string :entidad_federativa

      t.timestamps null: false
    end
  end
end
