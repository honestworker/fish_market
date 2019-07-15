class TranslateBlog < ActiveRecord::Migration[5.1]
  def self.up
    Blog.create_translation_table!({
                                        :title => :string,
                                        :body => :text
                                    }, {
                                        :migrate_data => true,
                                        :remove_source_columns => true
                                    })
  end

  def self.down
    Blog.drop_translation_table! :migrate_data => true
  end
end
