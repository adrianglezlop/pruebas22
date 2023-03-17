class CreateConfs < ActiveRecord::Migration
  def change
    create_table :confs do |t|
      t.string :telefono
      t.string :domicilio
      t.string :correo

      t.timestamps null: false
    end
  end
end
