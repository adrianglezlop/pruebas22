class AddInteresesMoratoriosflagToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :interes_flag, :boolean
  end
end
