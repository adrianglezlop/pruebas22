class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :folio

      t.timestamps null: false
    end
  end
end
