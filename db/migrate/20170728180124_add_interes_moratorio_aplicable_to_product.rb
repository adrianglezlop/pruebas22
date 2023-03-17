class AddInteresMoratorioAplicableToProduct < ActiveRecord::Migration
  def change
    add_column :products, :interes_moratorio_aplicable, :decimal, :precision => 10, :scale => 2
  end
end
