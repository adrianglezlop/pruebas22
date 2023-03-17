class AddNewValuesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :fiel, :integer
  end
end
