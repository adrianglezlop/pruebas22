class RemoveProductIdFromBranchOffices < ActiveRecord::Migration
  def change
    remove_column :branch_offices, :product_id, :integer
  end
end
