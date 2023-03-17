class CreateProfecions < ActiveRecord::Migration
  def change
    create_table :profecions do |t|
      t.integer :clave
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
