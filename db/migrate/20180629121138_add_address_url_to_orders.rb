class AddAddressUrlToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :address_url, :string
  end
end
