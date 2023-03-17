class AddBancoYCuentaToBranchOffice < ActiveRecord::Migration
  def change
    add_column :branch_offices, :banco, :string
    add_column :branch_offices, :cuenta, :string
  end
end
