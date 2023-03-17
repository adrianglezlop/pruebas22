class ChangeTipoNumeroExtToUser < ActiveRecord::Migration
  def up
    change_column :users, :numero_int, :string
  end

  def down
    change_column :users, :numero_int, :integer
  end
end
