class AddClaveToBranchOffice < ActiveRecord::Migration
  def change
    add_column :branch_offices, :clave, :string
  end
end
