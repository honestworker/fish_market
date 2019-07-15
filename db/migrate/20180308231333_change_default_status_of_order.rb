class ChangeDefaultStatusOfOrder < ActiveRecord::Migration[5.1]
  def up
    change_column_default :orders, :status, "cart"
  end

  def down
    change_column_default :orders, :status, "pending"
  end
end
