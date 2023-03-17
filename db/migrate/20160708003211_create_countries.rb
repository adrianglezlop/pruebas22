class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :clave
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
