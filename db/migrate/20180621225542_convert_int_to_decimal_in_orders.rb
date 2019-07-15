class ConvertIntToDecimalInOrders < ActiveRecord::Migration[5.1]
  def up
    change_column :orders, :subtotal, :decimal, default: 0.0
    change_column :orders, :total, :decimal, default: 0.0
    change_column :orders, :tax, :decimal, default: 0.0
  end

  def down
    change_column :orders, :subtotal, :integer, default: 0
    change_column :orders, :total, :integer, default: 0
    change_column :orders, :tax, :integer, default: 0
  end
end
