class AddNewValuesToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :fiel, :integer
  end
end
