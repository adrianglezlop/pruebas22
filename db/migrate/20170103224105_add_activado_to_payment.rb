class AddActivadoToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :activado, :boolean
  end
end
