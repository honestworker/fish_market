class CreateServiceImages < ActiveRecord::Migration[5.1]
  def change
    create_table :service_images do |t|
      t.string :title
      t.integer :other_service_id
      t.attachment :image

      t.timestamps
    end
    add_index :service_images, :other_service_id
  end
end
