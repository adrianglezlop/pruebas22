class RemoveValeFromCredits < ActiveRecord::Migration
  def change
    remove_column :credits, :vale, :string
  end
end
