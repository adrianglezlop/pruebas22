class AddCreditReferenceToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :credit, index: true, foreign_key: true
  end
end
