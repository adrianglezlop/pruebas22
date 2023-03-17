class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :cantidad
      t.references :payment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
