class AddActivoToUser < ActiveRecord::Migration
  def change
    add_column :users, :activo, :integer, default: 1
  end
end
