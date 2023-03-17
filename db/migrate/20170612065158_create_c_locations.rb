class CreateCLocations < ActiveRecord::Migration
  def change
    create_table :c_locations do |t|
      t.string :nombre
      t.string :clave
      t.references :c_municipality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
