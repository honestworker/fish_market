class RemoveUniquenessFromUsersIndexs < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :email
    add_index :users, :email
    remove_index :users, :mobile_number
    add_index :users, :mobile_number
  end
end
