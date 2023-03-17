class ChangeTipoNumeroExtToBranchOffice < ActiveRecord::Migration
  def up
    change_column :branch_offices, :no_int, :string
  end

  def down
    change_column :branch_offices, :no_int, :integer
  end
end
