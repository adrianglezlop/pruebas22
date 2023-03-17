class AddCodigoPostalToCLocation < ActiveRecord::Migration
  def change
    add_column :c_locations, :codigo_postal, :string
  end
end
