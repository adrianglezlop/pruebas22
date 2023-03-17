class AddPlazoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :plazo, :string
  end
end
