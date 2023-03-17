class CreateExpires < ActiveRecord::Migration
  def change
    create_table :expires do |t|
      t.string :comentarios
      t.integer :afectados
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
