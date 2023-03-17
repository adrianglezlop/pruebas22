class AddStatusToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :status, :integer
  end
end
