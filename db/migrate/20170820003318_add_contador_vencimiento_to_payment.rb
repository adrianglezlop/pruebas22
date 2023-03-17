class AddContadorVencimientoToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :vencimientos, :integer
  end
end
