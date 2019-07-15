class AddProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.attachment :image
      t.string :title
      t.references :product, foreign_key: true, index: true

      t.timestamps
    end
  end
end