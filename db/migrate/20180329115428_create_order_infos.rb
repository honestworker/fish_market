class CreateOrderInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :order_infos do |t|
      t.text :address
      t.string :phone_number
      t.string :name
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
