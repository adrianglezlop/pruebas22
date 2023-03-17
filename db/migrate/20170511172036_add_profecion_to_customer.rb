class AddProfecionToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :profecion, index: true, foreign_key: true
  end
end
