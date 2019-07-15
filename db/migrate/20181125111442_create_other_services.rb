class CreateOtherServices < ActiveRecord::Migration[5.1]
  def change
    create_table :other_services do |t|
      t.string :name
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
