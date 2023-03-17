class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :clave
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
