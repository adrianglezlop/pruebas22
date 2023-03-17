class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
