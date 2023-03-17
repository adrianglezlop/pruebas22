class AddTimeManageToPayout < ActiveRecord::Migration
  def change
    add_column :payouts, :days, :string
    add_column :payouts, :flow, :string
    add_column :payouts, :type_payout, :integer
  end
end
