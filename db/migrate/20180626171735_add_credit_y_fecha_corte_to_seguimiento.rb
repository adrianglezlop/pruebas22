class AddCreditYFechaCorteToSeguimiento < ActiveRecord::Migration
  def change
    add_column :seguimientos, :credit_id, :integer
    add_column :seguimientos, :fecha_corte, :date
  end
end
