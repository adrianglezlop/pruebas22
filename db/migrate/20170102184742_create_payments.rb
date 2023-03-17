class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :folio
      t.date :fecha_de_pago
      t.string :recibo
      t.integer :estatus
      t.decimal :importe
      t.decimal :pago
      t.decimal :interes

      t.timestamps null: false
    end
  end
end
