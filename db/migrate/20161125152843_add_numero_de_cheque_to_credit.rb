class AddNumeroDeChequeToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :numero_de_cheque, :integer
  end
end
