class ChangeDataTypeOfLongLatInOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :address_long, :decimal
    change_column :orders, :address_lat, :decimal
  end
end
