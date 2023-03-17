class CreateEconomicalActivities < ActiveRecord::Migration
  def change
    create_table :economical_activities do |t|
      t.integer :clave
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
