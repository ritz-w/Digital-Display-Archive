class DropOrders < ActiveRecord::Migration[5.0]
  def up
    drop_table :orders
  end
end
