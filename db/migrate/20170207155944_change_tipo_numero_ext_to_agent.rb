class ChangeTipoNumeroExtToAgent < ActiveRecord::Migration
  def up
    change_column :agents, :numero_interior, :string
  end

  def down
    change_column :agents, :numero_interior, :integer
  end
end
