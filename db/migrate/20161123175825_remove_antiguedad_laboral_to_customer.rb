class RemoveAntiguedadLaboralToCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :antiguedad_laboral, :string
  end
end
