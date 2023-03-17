class AddValeToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :vale, :string
  end
end
