class AddPaymentReferencesToReceipt < ActiveRecord::Migration
  def change
    add_reference :receipts, :payment, index: true, foreign_key: true
  end
end
