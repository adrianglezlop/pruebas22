class ChangeDataTypeNoIntToCredit < ActiveRecord::Migration
  def up
    change_column :credits, :numero_interior, :string
  end

  def down
    change_column :credits, :numero_interior, :integer
  end
end
