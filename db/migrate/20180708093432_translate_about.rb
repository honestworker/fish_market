class TranslateAbout < ActiveRecord::Migration[5.1]
  def self.up
    About.create_translation_table!({
                                             :body => :text
                                         }, {
                                             :migrate_data => true,
                                             :remove_source_columns => true
                                         })
  end

  def self.down
    About.drop_translation_table! :migrate_data => true
  end
end
