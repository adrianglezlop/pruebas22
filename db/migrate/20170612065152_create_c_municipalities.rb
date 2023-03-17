class CreateCMunicipalities < ActiveRecord::Migration
  def change
    create_table :c_municipalities do |t|
      t.string :nombre
      t.string :clave
      t.references :c_state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
