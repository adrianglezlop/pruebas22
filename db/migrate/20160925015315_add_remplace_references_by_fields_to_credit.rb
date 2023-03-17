class AddRemplaceReferencesByFieldsToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :pais_de_nacimiento, :string
    add_column :credits, :estado_actual, :string
    add_column :credits, :localidad, :string
  end
end
