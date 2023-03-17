class CreateCCountries < ActiveRecord::Migration
  def change
    create_table :c_countries do |t|
      t.string :nombre
      t.string :clave

      t.timestamps null: false
    end
  end
end
