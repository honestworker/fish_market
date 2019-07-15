class AddSlicingTypeToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :slicing_type, :string, default: 0
  end
end
