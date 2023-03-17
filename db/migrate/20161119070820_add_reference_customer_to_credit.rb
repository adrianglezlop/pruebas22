class AddReferenceCustomerToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :customer, index: true, foreign_key: true
  end
end
