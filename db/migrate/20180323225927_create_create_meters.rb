class CreateCreateMeters < ActiveRecord::Migration[5.1]
  def change
    create_table :meters do |t|
      t.integer :percentage

      t.timestamps
    end
  end
end
