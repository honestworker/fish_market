class TranslateProduct < ActiveRecord::Migration[5.1]
  def self.up
    unless ActiveRecord::Base.connection.table_exists? 'product_translations'
      Product.create_translation_table!({
           :name => :string,
           :desc => :text
      }, {
           :migrate_data => true,
           :remove_source_columns => true
      })
    end
  end

  def self.down
    if ActiveRecord::Base.connection.table_exists? 'product_translations'
      Product.drop_translation_table! :migrate_data => true
    end
  end
end
