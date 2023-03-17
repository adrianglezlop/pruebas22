class CreateCStates < ActiveRecord::Migration
  def change
    create_table :c_states do |t|
      t.string :nombre
      t.string :clave
      t.references :c_country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
