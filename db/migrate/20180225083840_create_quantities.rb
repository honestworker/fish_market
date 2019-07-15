class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.decimal :quantity, :default => 0.0
      t.string :unit, default: 'km'
      t.string :quantity_type
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
