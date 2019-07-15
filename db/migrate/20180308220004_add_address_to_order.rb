class AddAddressToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :user_phone_number, :string
    add_column :orders, :address, :string
    add_column :orders, :address_long, :decimal, default: 0.0
    add_column :orders, :address_lat, :decimal, default: 0.0
  end
end
