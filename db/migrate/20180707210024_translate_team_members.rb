class TranslateTeamMembers < ActiveRecord::Migration[5.1]
  def self.up
    TeamMember.create_translation_table!({
         :name => :string,
         :job_title => :string,
         :summary => :text
    }, {
         :migrate_data => true,
         :remove_source_columns => true
    })
  end

  def self.down
    TeamMember.drop_translation_table! :migrate_data => true
  end
end
