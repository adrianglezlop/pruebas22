class CreateOcupations < ActiveRecord::Migration
  def change
    create_table :ocupations do |t|
      t.integer :clave
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
