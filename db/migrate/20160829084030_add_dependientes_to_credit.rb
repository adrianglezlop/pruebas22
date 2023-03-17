class AddDependientesToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :nombre_completo_4, :string
    add_column :credits, :edad_4, :string
    add_column :credits, :parentesco_del_dependiente_4, :string
  end
end
