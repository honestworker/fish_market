class AddFieldsToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :active, :boolean
    change_column :products, :piece_price, :decimal, precision: 5, scale: 2
    change_column :products, :kilo_price, :decimal, precision: 5, scale: 2
  end

  def down
    remove_column :products, :active
    change_column :products, :piece_price, :integer
    change_column :products, :kilo_price, :integer
  end
end
