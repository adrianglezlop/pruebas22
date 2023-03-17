class ChangeTipoNumeroExtToCompany < ActiveRecord::Migration
  def up
    change_column :companies, :numero_interior, :string
  end

  def down
    change_column :companies, :numero_interior, :integer
  end
end
