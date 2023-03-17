class ChangeDataTypeBancoToBranchOffice < ActiveRecord::Migration
  def up
    change_column :branch_offices, :banco, :string
  end

  def down
    change_column :branch_offices, :banco, :integer
  end
end
