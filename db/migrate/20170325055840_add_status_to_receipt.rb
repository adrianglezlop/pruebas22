class AddStatusToReceipt < ActiveRecord::Migration
  def change
    add_column :receipts, :status, :integer
  end
end
