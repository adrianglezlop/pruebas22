class RemoveParentesco1ToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :parentesco1, :string
  end
end
