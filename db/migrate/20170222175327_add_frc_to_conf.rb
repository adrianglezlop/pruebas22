class AddFrcToConf < ActiveRecord::Migration
  def change
    add_column :confs, :RFC, :string
  end
end
