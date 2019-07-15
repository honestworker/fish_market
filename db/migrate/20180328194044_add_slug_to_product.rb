class AddSlugToProduct < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :slug, :string, unique: true
    add_index :products, :slug
  end

  def down
  	remove_column :products, :slug
  end
end
