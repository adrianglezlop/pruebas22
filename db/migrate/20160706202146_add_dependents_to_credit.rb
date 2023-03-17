class AddDependentsToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :nombre_completo_1, :string
    add_column :credits, :edad_1, :integer
    add_column :credits, :parentesco_del_dependiente_1, :string
    add_column :credits, :nombre_completo_2, :string
    add_column :credits, :edad_2, :integer
    add_column :credits, :parentesco_del_dependiente_2, :string
    add_column :credits, :nombre_completo_3, :string
    add_column :credits, :edad_3, :integer
    add_column :credits, :parentesco_del_dependiente_3, :string
  end
end
