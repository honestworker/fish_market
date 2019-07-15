class AddQuantityTypeToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :quantity_type, :string, default: 1
  end
end
