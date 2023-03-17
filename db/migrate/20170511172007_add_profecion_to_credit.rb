class AddProfecionToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :profecion, index: true, foreign_key: true
  end
end
