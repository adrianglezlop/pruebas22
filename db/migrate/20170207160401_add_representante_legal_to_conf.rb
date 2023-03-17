class AddRepresentanteLegalToConf < ActiveRecord::Migration
  def change
    add_column :confs, :representante_legal, :string
  end
end
