class AddReferencesToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :loan, index: true, foreign_key: true
    add_reference :products, :payout, index: true, foreign_key: true
  end
end
