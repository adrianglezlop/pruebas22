class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.string :texto

      t.timestamps null: false
    end
  end
end
