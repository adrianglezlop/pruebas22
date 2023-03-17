class CreateCodigoPostals < ActiveRecord::Migration
  def change
    create_table :codigo_postals do |t|
      t.integer :cp
      t.text :data

      t.timestamps null: false
    end
  end
end
