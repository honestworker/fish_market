class AddNotesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :notes, :text
  end
end
