class AddParentesco2ToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :parentesco_2, :string
  end
end
