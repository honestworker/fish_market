class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.attachment :image
      t.string :body
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
