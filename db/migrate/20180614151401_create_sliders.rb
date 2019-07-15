class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.attachment :image
      t.string :link
      t.text :text

      t.timestamps
    end
  end
end
